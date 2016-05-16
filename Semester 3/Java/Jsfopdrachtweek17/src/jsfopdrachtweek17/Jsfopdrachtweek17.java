/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsfopdrachtweek17;

import com.sun.jna.ptr.IntByReference;
import java.io.BufferedReader;
import java.io.Console;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 *
 * @author Ruud
 */
public class Jsfopdrachtweek17 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        //systemtime
        ISystemtime lib = ISystemtime.INSTANCE;

        Systemtime systemTime = new Systemtime();
        lib.GetSystemTime(systemTime);
        long nanoTime = System.nanoTime();
        System.out.println(systemTime.toString());

        for (int i = 0; i < 1000000000; i++) {

        }

        lib.GetSystemTime(systemTime);
        System.out.println(systemTime.toString());

        long nanoTime2 = System.nanoTime();
        System.out.println(String.format("nanoTime : %d ms", nanoTime2 - nanoTime));

        //freespace
        IntByReference sectorsPerCluster = new IntByReference();
        IntByReference bytesPerSector = new IntByReference();
        IntByReference numberOfFreeClusters = new IntByReference();
        IntByReference totalNumberOfClusters = new IntByReference();

        lib.GetDiskFreeSpaceA("C:\\",
                sectorsPerCluster,
                bytesPerSector,
                numberOfFreeClusters,
                totalNumberOfClusters
        );
        System.out.println("sectorsPerCluster: "+sectorsPerCluster.getValue());
        System.out.println("bytesPerSector: "+bytesPerSector.getValue());
        System.out.println("numberOfFreeClusters: "+numberOfFreeClusters.getValue());
        System.out.println("totalNumberOfClusters: " + totalNumberOfClusters.getValue());

        long freeSpace = ((long) (numberOfFreeClusters.getValue() * sectorsPerCluster.getValue()) * bytesPerSector.getValue()) / 1024;
        System.out.println(String.format("Free disk space : %d kB", freeSpace));
        freeSpace = ((long) (numberOfFreeClusters.getValue() * sectorsPerCluster.getValue()) * bytesPerSector.getValue()) / 1024 / 1024;
        System.out.println(String.format("Free disk space : %d mB", freeSpace));
        freeSpace = ((long) (numberOfFreeClusters.getValue() * sectorsPerCluster.getValue()) * bytesPerSector.getValue()) / 1024 / 1024 / 1024;
        System.out.println(String.format("Free disk space : %d gB", freeSpace));
        Console cons = System.console();
        if (cons != null) {
            cons.printf("Enter to exit ");
            cons.readLine();
        }

    }
}
