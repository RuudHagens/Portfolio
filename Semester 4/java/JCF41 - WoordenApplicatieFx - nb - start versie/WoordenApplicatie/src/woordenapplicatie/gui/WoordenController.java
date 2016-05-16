package woordenapplicatie.gui;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;
import java.util.TreeSet;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;

/**
 * FXML Controller class
 *
 * @author frankcoenen
 */
public class WoordenController implements Initializable {

    private static String DEFAULT_TEXT = "Een, twee, drie, vier\n"
            + "Hoedje van, hoedje van\n"
            + "Een, twee, drie, vier\n"
            + "Hoedje van papier\n"
            + "\n"
            + "Heb je dan geen hoedje meer\n"
            + "Maak er één van bordpapier\n"
            + "Eén, twee, drie, vier\n"
            + "Hoedje van papier\n"
            + "\n"
            + "Een, twee, drie, vier\n"
            + "Hoedje van, hoedje van\n"
            + "Een, twee, drie, vier\n"
            + "Hoedje van papier\n"
            + "\n"
            + "En als het hoedje dan niet past\n"
            + "Zetten we 't in de glazenkas\n"
            + "Een, twee, drie, vier\n"
            + "Hoedje van papier";

    @FXML
    private Button btAantal;
    @FXML
    private TextArea taInput;
    @FXML
    private Button btSorteer;
    @FXML
    private Button btFrequentie;
    @FXML
    private Button btConcordantie;
    @FXML
    private TextArea taOutput;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        taInput.setText(DEFAULT_TEXT);
    }


    @FXML
    private void aantalAction(ActionEvent event) {
        String[] splitter = getSplit();
        Set<String> set = new HashSet<>();
        set.addAll(Arrays.asList(splitter));
        for(String s : splitter){
            System.out.println(s);
        }        
        taOutput.setText("Totaal aantal woorden: " + splitter.length +"\nAantal verschillende woorden: "+ set.size());
    }

    @FXML
    private void sorteerAction(ActionEvent event) {
        String[] splitter = getSplit();
        TreeSet<String> set = new TreeSet<>();
        set.addAll(Arrays.asList(splitter));
        taOutput.clear();
        set.descendingSet().forEach(s -> taOutput.appendText(s + "\n"));        
    }

    @FXML
    private void frequentieAction(ActionEvent event) {
        String[] splitter = getSplit();
        
        Map<String, Integer> counter = new HashMap<>();
        
        // add key for every String in splitter. 
        for(String s : splitter){
            counter.put(s,counter.containsKey(s) ? counter.get(s) +1:1);
        }
        
        //Clear output textarea
        taOutput.clear();
        
        counter.entrySet().stream().sorted(Map.Entry.<String, Integer>comparingByValue()).forEach(entry -> taOutput.appendText(entry.getKey() + ": " + entry.getValue() + "\n"));
        
    }

    @FXML
    private void concordatieAction(ActionEvent event) {
        int counter = 0;
        
        
        String[] splitter = getSplit();
        Set<String> set = new HashSet<>();
        set.addAll(Arrays.asList(splitter));
        List<String> regels = Arrays.asList(taInput.getText().toLowerCase().split("\n"));
        
        taOutput.clear();
        
        for(String s : set)
        {
            String regel = "";
            counter = 0;
            for(String r : regels)
            {
                counter ++;
                if(r.contains(s))
                {       
                    regel = regel + ", " + counter; 
                }
            }
            String newregel = regel.substring(2);
            taOutput.setText(taOutput.getText() + "\n" + s + ":  " + "[" + newregel + "]");
        }
        
    }
    
        
    private String[] getSplit(){
        return taInput.getText().replace(",","").replace("\n"," ").toLowerCase().split("\\s");
    }

}
