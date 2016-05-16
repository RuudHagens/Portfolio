/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aex.banner.classes;

import fontys.observer.RemotePropertyListener;
import java.util.ArrayList;
import java.rmi.*;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Ruud
 */
public class EffectenBeurs extends UnicastRemoteObject implements IEffectenBeurs{

    public EffectenBeurs() throws RemoteException{
        
    }
    
    @Override
    public ArrayList<IFonds> getKoersen() throws RemoteException{
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void addListener(RemotePropertyListener listener, String property) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void removeListener(RemotePropertyListener listener, String property) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
