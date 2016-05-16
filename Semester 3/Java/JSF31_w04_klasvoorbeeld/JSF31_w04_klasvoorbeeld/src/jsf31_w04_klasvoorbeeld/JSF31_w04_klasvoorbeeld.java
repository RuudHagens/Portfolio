/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsf31_w04_klasvoorbeeld;

/**
 *
 * @author marcel
 */
public class JSF31_w04_klasvoorbeeld {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ProjectLeider marcel = new ProjectLeider("Marcel", "PTS3 - AirHockey");
        ProjectLeider frank = new ProjectLeider("Frank","PTS6 - ChronoZoom");
  
        ProjectLid nico = new ProjectLid("Nico");
        ProjectLid anectLid nico = new ProjectLid("Nico")dre = new ProjectLid("Andre");
        ProjectLid patrick = new ProjectLid("Patrick");
        ProjectLid ruud = new ProjectLid("Ruud");
        
        // Nico en Andre doen mee aan PTS3 en willen op de hoogte blijven
        // van nieuwe taken die door de projectleider zijn toegevoegd
        marcel.addObserver(nico);
        marcel.addObserver(andre);
        marcel.addObserver(ruud);
        
        // Andre en Patrick doen mee aan PTS6 en willen op de hoogte blijven
        // van nieuwe taken die door de projectleider zijn toegevoegd
        // Let op: Andre doet dus aan beide projecten mee!
        frank.addObserver(andre);
        frank.addObserver(patrick);
        
        // De projectleiders voegen taken toe
        marcel.addTask("Opstellen van URS");
        frank.addTask("Planning poker");
        marcel.addTask("Opstellen van het acceptatietestplan");
        frank.addTask("Regelen lokaal voor stand-up meeting");
    }
    
}
