/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsfopdrachtweek17;

import com.sun.jna.Structure;
import com.sun.jna.ptr.IntByReference;
import java.util.List;

/**
 *
 * @author Ruud
 */
public class FreeSpace extends Structure {

    public IntByReference sectorsPerCluster ;
    public IntByReference bytesPerSector ;
    public IntByReference numberOfFreeClusters ;
    public IntByReference totalNumberOfClusters ;

    public IntByReference getSectorsPerCluster() {
        return sectorsPerCluster;
    }

    public IntByReference getBytesPerSector() {
        return bytesPerSector;
    }

    public IntByReference getNumberOfFreeClusters() {
        return numberOfFreeClusters;
    }

    public IntByReference getTotalNumberOfClusters() {
        return totalNumberOfClusters;
    }

    @Override
    protected List getFieldOrder() {
        return null;
    }
}
