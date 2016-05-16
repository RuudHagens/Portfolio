/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsfopdrachtweek17;

import com.sun.jna.Library;
import com.sun.jna.Native;
import com.sun.jna.ptr.IntByReference;

/**
 *
 * @author Ruud
 */
public interface ISystemtime extends Library {

    public ISystemtime INSTANCE = (ISystemtime) Native.loadLibrary("Kernel32", ISystemtime.class);

    // the function we need
    void GetSystemTime(Systemtime st);

    boolean GetDiskFreeSpaceA(String path, IntByReference sectorsPerCluster, IntByReference bytesPerSector, IntByReference numberOfFreeClusters, IntByReference totalNumberOfClusters);

    boolean GetDiskFreeSpaceW(char[] chars, IntByReference sectorsPerCluster, IntByReference bytesPerSector, IntByReference numberOfFreeClusters, IntByReference totalNumberOfClusters);
}
