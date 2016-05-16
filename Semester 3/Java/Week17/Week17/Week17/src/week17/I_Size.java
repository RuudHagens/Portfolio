/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package week17;

import com.sun.jna.Library;
import com.sun.jna.Native;
import com.sun.jna.ptr.IntByReference;

/**
 *
 * @author marij
 */
public interface I_Size extends Library {
    public I_Size INSTANCE=(I_Size)Native.loadLibrary("Kernel32",I_Size.class);
		
	// the function we need
	public int GetDiskFreeSpaceA(String disk, IntByReference SectorsPerCluster, IntByReference BytesPerSector, IntByReference NumberOfFreeSectors, IntByReference TotalNumberOfClusters);
}
