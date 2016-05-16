/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aex.banner;

import aex.banner.classes.BannerController;
import aex.banner.classes.IFonds;
import fontys.observer.RemotePropertyListener;
import java.beans.PropertyChangeEvent;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.animation.AnimationTimer;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Stage;

/**
 *
 * @author Ruud
 */
public class AEXBanner extends Application{

    public static final int WIDTH = 1000;
    public static final int HEIGHT = 200;
    public static final int NANO_TICKS = 20000000; 
    // FRAME_RATE = 1000000000/NANO_TICKS = 50;

    private Text text;
    private String koersen = "";
    private double textLength;
    private double textPosition;
    private BannerController controller;
    private AnimationTimer animationTimer;
    private int teller = 0;

    @Override
    public void start(Stage primaryStage) {

        Font font = new Font("Arial", HEIGHT);
        text = new Text();
        text.setFont(font);
        text.setFill(Color.YELLOW);

        Pane root = new Pane();
        root.getChildren().add(text);
        Scene scene = new Scene(root, WIDTH, HEIGHT);
        scene.setFill(Color.BLACK);

        primaryStage.setTitle("AEX banner");
        primaryStage.setScene(scene);
        primaryStage.show();
        primaryStage.toFront();


        // Start animation: text moves from right to left
        animationTimer = new AnimationTimer() {
            private long prevUpdate;

            @Override
            public void handle(long now) {
                long lag = now - prevUpdate;
                if (lag >= NANO_TICKS) {
                    if (textPosition > -textLength)
                    {
                    // calculate new location of text
                    // TODO
                    textPosition = textPosition -15;
                    text.relocate(textPosition, 0);
                    prevUpdate = now;
                    //text.setText(koersen);
                    }
                    else
                    {
                        textPosition = WIDTH;
                    }
                }
            }
            @Override
            public void start() {
                prevUpdate = System.nanoTime();
                textPosition = WIDTH;
                text.relocate(textPosition, 0);
                text.setText("Nothing to display");
                super.start();
            }
        };
        animationTimer.start();
    }

    public void setKoersen(String koers) {
//        Platform.runLater(() ->
//        {  
            this.koersen += koers;
            text.setText(koersen);
            textLength = text.getLayoutBounds().getWidth();
//        });
    }

    @Override
    public void stop() {
        animationTimer.stop();
        //controller.stop();
    }
    
//        /**
//     * @param args the command line arguments
//     */
//    public static void main(String[] args) {
//        // TODO code application logic here
//        launch(args);
//    }
}
