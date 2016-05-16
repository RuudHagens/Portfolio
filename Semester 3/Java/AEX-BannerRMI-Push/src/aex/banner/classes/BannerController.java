/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aex.banner.classes;

/**
 *
 * @author Ruud
 */
import aex.banner.AEXBanner;
import fontys.observer.RemotePropertyListener;
import fontys.observer.RemotePublisher;
import java.beans.PropertyChangeEvent;
import java.net.MalformedURLException;
import java.rmi.AccessException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.application.Application;
import javafx.stage.Stage;
import static javafx.application.Application.launch;

public class BannerController extends Application implements RemotePropertyListener {

    private AEXBanner banner;
    public IEffectenBeurs effectenbeurs;
    private int teller =0;
    private String koersenreeks = "";
    //private final Timer pollingTimer;

//    public BannerController(AEXBanner banner) {
//
//        this.banner = banner;
//    }

    @Override
    public void start(Stage primaryStage){
        banner = new AEXBanner();
        
        try
        {
            UnicastRemoteObject.exportObject(this, 0);
        } catch (RemoteException ex)
        {
            Logger.getLogger(BannerController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try{
            Registry registry = LocateRegistry.getRegistry("localhost", 1099);
            effectenbeurs = (IEffectenBeurs) registry.lookup("MockEffectenBeurs");
            //publisher = (RemotePublisher) Naming.lookup("rmi://localhost:1099/MockEffectenBeurs");
            effectenbeurs.addListener(this, "koersen");
        }
        catch (NotBoundException | RemoteException ex)
        {
            Logger.getLogger(BannerController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        banner.start(primaryStage);
    }
    
    @Override
    public void propertyChange(PropertyChangeEvent evt) throws RemoteException {
         IFonds rijk = (IFonds) evt.getNewValue();
         koersenreeks += rijk.getNaam() + " " + rijk.getKoers() + " | ";
         if(teller >= 4)
         {
             banner.setKoersen(koersenreeks);
             koersenreeks = "";
             teller = 0;
         }
         teller ++;
         
    }
    
    public static void main(String[] args) {
        // TODO code application logic here
        launch(args);
    }

}

