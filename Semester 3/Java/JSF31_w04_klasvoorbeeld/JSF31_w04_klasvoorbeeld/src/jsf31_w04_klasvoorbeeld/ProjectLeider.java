/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsf31_w04_klasvoorbeeld;

import java.util.ArrayList;
import java.util.List;
import java.util.Observable;

/**
 *
 * @author marcel
 */
public class ProjectLeider extends Observable {

    private final String name;
    private final String projectName;
    private final List<String> tasks;

    public ProjectLeider(String name, String projectName) {
        this.tasks = new ArrayList<>();
        this.name = name;
        this.projectName = projectName;
    }
    
    public void addTask(String task) {
        this.tasks.add(task);
        this.setChanged();
        this.notifyObservers(task);
    }
    
    public String getName() {
        return name;
    }

    public String getProjectName() {
        return projectName;
    }

}
