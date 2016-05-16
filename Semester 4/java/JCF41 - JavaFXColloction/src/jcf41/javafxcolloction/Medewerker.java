/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jcf41.javafxcolloction;

import java.util.Date;
import java.util.Observable;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.beans.property.SimpleDoubleProperty;
import javafx.beans.property.SimpleStringProperty;

/**
 *
 * @author Ruud
 */
public class Medewerker extends Observable implements Comparable<Medewerker> {
    private SimpleStringProperty naam;
    private Functie sector;
    private SimpleDoubleProperty salaris;

    public Medewerker(String naam, Functie sector, double salaris) {
        this.naam = new SimpleStringProperty(naam);
        this.sector = sector;
        this.salaris = new SimpleDoubleProperty(salaris);
    }
    
    public String getNaam() {
        return naam.get();
    }

    public Functie getSector() {
        return sector;
    }

    public double getSalaris() {
        return salaris.get();
    }

    public void setNaam(String naam) {
        this.naam.set(naam);
        change();
    }

    public void setSector(Functie sector) {
        this.sector = sector;
        change();
    }

    public void setSalaris(double salaris) {
        this.salaris.set(salaris);
        change();
    }

    @Override
    public String toString() {
        return naam.get();
    }

    @Override
    public int compareTo(Medewerker t) {
        return t.getNaam().compareTo(this.getNaam());
    }
    
    public void change(){
        setChanged();
        notifyObservers();
    }
}
