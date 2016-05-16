/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package week17;

import com.sun.jna.ptr.IntByReference;

/**
 *
 * @author marij
 */
public class Week17 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        I_Time lib = I_Time.INSTANCE;
        I_Size lib2 = I_Size.INSTANCE;
        
        System.out.println("-- Disk Space --");
        
        String disk = "C:\\";
        IntByReference lpSectorsPerCluster = new IntByReference();
        IntByReference lpBytesPerSector = new IntByReference();
        IntByReference lpNumberOfFreeClusters = new IntByReference();
        IntByReference lpTotalNumberOfClusters = new IntByReference();
	
        lib2.GetDiskFreeSpaceA(disk, lpSectorsPerCluster, lpBytesPerSector, lpNumberOfFreeClusters, lpTotalNumberOfClusters);
	
        long multiplier = lpSectorsPerCluster.getValue() * lpBytesPerSector.getValue();
        long free = lpNumberOfFreeClusters.getValue() * multiplier;
	long total = lpTotalNumberOfClusters.getValue() * multiplier;
        
        System.out.println("Free space on disk " + disk + " " + String.valueOf(free) + " of total " + String.valueOf(total));
        System.out.println();
        
        System.out.println("-- Time --");

        SYSTEM_TIME time = new SYSTEM_TIME();

        lib.GetSystemTime(time);

        System.out.println(time.toString() + " First OS call");
        System.out.println(System.nanoTime() + " First System Call");
        
        for (long a = 0; a < 1000000000; a++){
            long b = 1;
            b++;
        }
        
        lib.GetSystemTime(time);
        System.out.println(time.toString() + " Second OS Call");
        System.out.println(System.nanoTime() + " Second System Call");
    }
    
}
