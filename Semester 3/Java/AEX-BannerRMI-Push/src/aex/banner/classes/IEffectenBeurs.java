/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aex.banner.classes;

import fontys.observer.RemotePublisher;
import java.rmi.*;
import java.util.ArrayList;

/**
 *
 * @author Ruud
 */
public interface IEffectenBeurs extends RemotePublisher {
    public ArrayList<IFonds> getKoersen() throws RemoteException;
}
