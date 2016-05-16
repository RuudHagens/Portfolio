/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jcf41.javafxcolloction;

import java.util.Observable;
import java.util.Observer;
import java.util.TreeSet;
import javafx.collections.FXCollections;
import javafx.scene.control.TreeItem;
import javafx.collections.ObservableList;
import jcf41.javafxcolloction.gui.CollectionSchermController;
/**
 *
 * @author Ruud
 */
public class Afdeling extends Observable implements Observer, Comparable<Afdeling>{

    private String afdelingNaam;
    private ObservableList<Medewerker> medewerkers;

    public Afdeling(String afdelingNaam){
        this.afdelingNaam = afdelingNaam;
        this.medewerkers = FXCollections.observableArrayList();
    }

    public String getAfdelingNaam() {
        return afdelingNaam;
    }

    public void setAfdelingNaam(String afdelingNaam) {
        this.afdelingNaam = afdelingNaam;
        change();
    }

    public ObservableList<Medewerker> getMedewerkers() {
        return medewerkers;
    }

    public void setMedewerkers(ObservableList<Medewerker> medewerkers) {
        this.medewerkers = medewerkers;
        change();
    }

    @Override
    public String toString() {
        return afdelingNaam;
    }

    public void addMedewerker(Medewerker medewerker) {
        this.medewerkers.add(medewerker);
        medewerker.addObserver(this);
        change();
    }

    public TreeItem<Object> AddMedewerkToAfdelingTree() {

        TreeItem<Object> treeItem = new TreeItem<>(this);
        if (medewerkers.size() != 0) {
            for (Medewerker m : medewerkers) {
                treeItem.getChildren().add(new TreeItem<>(m));
            }
        }

        return treeItem;
    }
    
    public void change(){
        setChanged();
        notifyObservers();
    }

    @Override
    public void update(Observable o, Object o1) {
        change();
    }

    @Override
    public int compareTo(Afdeling t) {
        return t.getAfdelingNaam().compareTo(this.getAfdelingNaam());
    }
    
    
}
