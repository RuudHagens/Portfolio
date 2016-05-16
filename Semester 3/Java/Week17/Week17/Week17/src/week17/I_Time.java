/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package week17;

import com.sun.jna.Library;
import com.sun.jna.Native;

/**
 *
 * @author marij
 */
public interface I_Time extends Library {
    public I_Time INSTANCE=(I_Time)Native.loadLibrary("Kernel32",I_Time.class);
		
	// the function we need
	public int GetSystemTime(SYSTEM_TIME result);
}
