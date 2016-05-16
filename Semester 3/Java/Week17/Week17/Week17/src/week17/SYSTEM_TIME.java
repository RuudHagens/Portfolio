/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package week17;

import com.sun.jna.Structure;

/**
 *
 * @author marij
 */
public class SYSTEM_TIME extends Structure{
    public short Year;
    public short Month;
    public short DayOfWeek;
    public short Day;
    public short Hour;
    public short Minute;
    public short Second;
    public short Millisecond;
    
    public String toString(){
        return String.valueOf(this.Millisecond);
    }
}
