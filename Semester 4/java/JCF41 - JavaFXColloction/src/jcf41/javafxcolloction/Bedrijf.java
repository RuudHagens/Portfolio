/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jcf41.javafxcolloction;

import java.util.Observable;
import java.util.Observer;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.control.TreeItem;

/**
 *
 * @author Ruud
 */
public class Bedrijf extends Observable implements Observer{
    private String naam;
    private ObservableList<Afdeling> afdelingen;

    public Bedrijf(String naam) {
        this.naam = naam;
        this.afdelingen = FXCollections.observableArrayList();
    }

    public String getNaam() {
        return naam;
    }

    public ObservableList<Afdeling> getAfdelingen() {
        return afdelingen;
    }

    public void setNaam(String naam) {
        this.naam = naam;
    }

        @Override
    public String toString() {
        return this.naam;
    }

    public void addAfdeling(Afdeling a) {
        this.afdelingen.add(a);
        a.addObserver(this);
        change();
    }

    private void change() {
        setChanged();
        notifyObservers();
    }

    public TreeItem<Object> AddAfdelingToBedrijfTree() {
        TreeItem<Object> rootItem = new TreeItem<>(this);
        afdelingen.forEach(a -> rootItem.getChildren().add(a.AddMedewerkToAfdelingTree()));
        return rootItem;
    }

    @Override
    public void update(Observable observable, Object o) {
        change();
    }
}
