/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aex.banner.classes;

import fontys.observer.BasicPublisher;
import fontys.observer.RemotePublisher;
import fontys.observer.RemotePropertyListener;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Random;
import java.rmi.*;
import java.rmi.registry.LocateRegistry;
import java.rmi.server.UnicastRemoteObject;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.embed.swing.JFXPanel;

/**
 *
 * @author Ruud
 */
class MockEffectenbeurs extends UnicastRemoteObject implements IEffectenBeurs{
    
    private Timer time;
    private BasicPublisher basicPublisher;
    private static final int portNumber = 1099;
    private static final String bindingName = "MockEffectenBeurs";
    private ArrayList<IFonds> fondsen;
    
    public MockEffectenbeurs() throws RemoteException{
         time = new Timer();
         fondsen = new ArrayList<>();
         basicPublisher = new BasicPublisher(new String[]{"koersen"});
         time.schedule(new Time(), 0, 10000);
    }

    @Override
    public ArrayList<IFonds> getKoersen() throws RemoteException{        
        fondsen.add(new Fonds("Google", GenerateRandomKoersnr()));
        fondsen.add(new Fonds("Oracle", GenerateRandomKoersnr()));
        fondsen.add(new Fonds("Microsoft", GenerateRandomKoersnr()));
        fondsen.add(new Fonds("Bol.com", GenerateRandomKoersnr()));
        return fondsen;
    }
    
    public double GenerateRandomKoersnr () {
        Random r = new Random();
        double koers = r.nextInt(100);
        return koers;      
    }
    
//    public String GenerateRandomKoersNaam() {
//        char[] chars = "abcdefghijklmnopqrstuvwxyz".toCharArray();
//        StringBuilder sb = new StringBuilder();
//        Random random = new Random();
//        for (int i = 0; i < 3; i++) {
//            char c = chars[random.nextInt(chars.length)];
//            sb.append(c);
//        }
//        String output = sb.toString();
//        return output;
//    }

    @Override
    public void addListener(RemotePropertyListener listener, String property) throws RemoteException {
        basicPublisher.addListener(listener, null);
    }

    @Override
    public void removeListener(RemotePropertyListener listener, String property) throws RemoteException {
        basicPublisher.removeListener(listener, null);
    }

    public static void main(String[] args) {
        // TODO code application logic here
        JFXPanel fxpanel = new JFXPanel();
        try {
            LocateRegistry.createRegistry(portNumber);
            IEffectenBeurs mockeffectenbeurs = new MockEffectenbeurs();
            Naming.rebind(bindingName, mockeffectenbeurs);
        } catch (MalformedURLException ex) {
            System.out.println("Server: kan effectenbeurs niet opstellen");
            System.out.println("Server: MalformedURLException: " + ex.getMessage());
        } catch (RemoteException ex) {
            System.out.println("Server: kan effectenbeurs niet opstellen");
            System.out.println("Server: RemoteException: " + ex.getMessage());
        }
        System.out.println("Server: mock effecten beurs is gebonden aan " + bindingName);
    }
    
    private class Time extends TimerTask
    {
        @Override
        public void run() {
            try {                
                for(IFonds f : getKoersen())
                {
                    inform(f);
                }
                //inform(getKoersen());
            } catch (RemoteException ex) {
                Logger.getLogger(MockEffectenbeurs.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public void inform(IFonds fonds)
    {
        basicPublisher.inform(this, "koersen", null, fonds);
    }
}
