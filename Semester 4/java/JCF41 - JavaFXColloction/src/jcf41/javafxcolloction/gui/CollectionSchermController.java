/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jcf41.javafxcolloction.gui;

import java.net.URL;
import java.util.Observable;
import java.util.Observer;
import java.util.ResourceBundle;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.CheckBoxTableCell;
import javafx.scene.control.cell.ComboBoxTableCell;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import jcf41.javafxcolloction.Afdeling;
import jcf41.javafxcolloction.Bedrijf;
import jcf41.javafxcolloction.Functie;
import jcf41.javafxcolloction.Medewerker;

/**
 *
 * @author Ruud
 */
public class CollectionSchermController implements Observer, Initializable {

    private final Bedrijf bedrijf = new Bedrijf("Google");

    private final Afdeling programmeerKamer = new Afdeling("programmeerKamer");
    private final Afdeling koffieKamer = new Afdeling("koffieKamer");
    private final Afdeling kantoor = new Afdeling("kantoor");

    private final Medewerker piet = new Medewerker("Piet", Functie.Programmeur, 25.00);
    private final Medewerker henk = new Medewerker("Henk", Functie.Tester, 30.00);

    @FXML
    private TreeView<Object> tvAfdelingen;

    @FXML
    private ComboBox cbAfdelingMedewerker;

    @FXML
    private TextField tbNaam;

    @FXML
    private ComboBox cbFunctie;

    @FXML
    private TextField tbSalaris;

    @FXML
    private Button btnNieuweMedewerker;

    @FXML
    private TextField tbAfdelingNaam;

    @FXML
    private Button btnNieuwAfdeling;

    @FXML
    private TableView<Medewerker> tabMedewerkers = new TableView<>();

    @FXML
    private ComboBox cbAfdelingKiezen;

    @FXML
    private Button btnGetMedewerkers;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        initTreeview();
        initTable();
        comboboxesUpdaten();
    }

    private void initTreeview() {
        bedrijf.addObserver(this);
        bedrijf.addAfdeling(kantoor);
        bedrijf.addAfdeling(programmeerKamer);
        bedrijf.addAfdeling(koffieKamer);

        kantoor.addMedewerker(henk);
        programmeerKamer.addMedewerker(piet);

        updateTreeView();
        tvAfdelingen.setShowRoot(true);
    }

    private void initTable() {
        tabMedewerkers.setEditable(true);

        //add naam to table
        TableColumn<Medewerker, String> naam = new TableColumn<>("Naam");
        naam.setCellValueFactory(new PropertyValueFactory<>("naam"));
        naam.setCellFactory(TextFieldTableCell.forTableColumn());
        naam.setOnEditCommit(t -> (t.getTableView().getItems().get(t.getTablePosition().getRow())).setNaam(t.getNewValue()));

        //add funtie to table
        TableColumn<Medewerker, Functie> functie = new TableColumn<>("Functie");
        functie.setCellValueFactory(new PropertyValueFactory<>("sector"));
        functie.setCellFactory(ComboBoxTableCell.forTableColumn(Functie.values()));
        functie.setOnEditCommit(t -> (t.getTableView().getItems().get(t.getTablePosition().getRow())).setSector(t.getNewValue()));

        //aad salaris to table
        TableColumn<Medewerker, Double> salaris = new TableColumn<>("Salaris");
        salaris.setCellValueFactory(new PropertyValueFactory<>("salaris"));
        salaris.setCellFactory(col
                -> new TableCell<Medewerker, Double>() {
                    @Override
                    public void updateItem(Double price, boolean empty) {
                        super.updateItem(price, empty);
                        if (empty) {
                            setText(null);
                        } else {
                            setText(String.format("€%.2f", price.doubleValue()));
                        }
                    }
                });

        //Ƶƶ(￣▵—▵￣)
        tabMedewerkers.getColumns().addAll(naam, functie, salaris);
    }

    @FXML
    private void NieuweAfdeling(ActionEvent event) {
        String naam = tbAfdelingNaam.getText();
        Afdeling a = new Afdeling(naam);
        bedrijf.addAfdeling(a);
        comboboxesUpdaten();
    }

    @FXML
    private void NieuweMedewerker(ActionEvent event) {
        String afdeling = cbAfdelingMedewerker.getValue().toString();
        String naam = tbNaam.getText();
        Functie functie = (Functie) cbFunctie.getValue();
        double salaris = Double.parseDouble(tbSalaris.getText());
        Medewerker m = new Medewerker(naam, functie, salaris);
        bedrijf.getAfdelingen().stream().filter((a) -> (a.getAfdelingNaam() == null ? afdeling == null : a.getAfdelingNaam().equals(afdeling))).forEach((a) -> {
            a.addMedewerker(m);
        });
    }

    @FXML
    private void getMedewerkers(ActionEvent event) {
        for (Afdeling a : bedrijf.getAfdelingen()) {
            if (a.getAfdelingNaam() == cbAfdelingKiezen.getSelectionModel().getSelectedItem().toString()){
                tabMedewerkers.setItems(a.getMedewerkers());
            }
        }
    }

    private void updateTreeView() {
        tvAfdelingen.setRoot(bedrijf.AddAfdelingToBedrijfTree());
        tvAfdelingen.getRoot().setExpanded(true);
    }

    private void comboboxesUpdaten() {
        cbAfdelingKiezen.getItems().clear();
        cbAfdelingMedewerker.getItems().clear();
        bedrijf.getAfdelingen().stream().map((af) -> {
            cbAfdelingKiezen.getItems().add(af.getAfdelingNaam());
            return af;
        }).forEach((af) -> {
            cbAfdelingMedewerker.getItems().add(af.getAfdelingNaam());
        });
    }

    @Override
    public void update(Observable o, Object o1) {
        updateTreeView();
    }
}
