/* autogenerated by Processing revision 1293 on 2023-09-25 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import interfascia.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class T5 extends PApplet {



GUIController c;
IFLabel[] l_x, l_y;
String labx, laby;
// int i = 0;
//declaracion de variables globales
int espacio=40;

public void setup() {
    /* size commented out by preprocessor */;  //establece el lienzo de 800x600
    frameRate(120);
    c = new GUIController (this);
    l_x[] = new IFLabel (labx, 0, 0);
    // c.add (l);
}

public void vertical(){        //funcion para dibujar lineas verticales
    for (int i=0; i<width; i+=espacio) {     //declara el contador inicial en 0 y mientras i sea menor al ancho de la ventana va a dibujar una linea, al contador se le incrementa el espacio
        // c.remove(l);
        line(i, 0, i, height);                //la linea se va a dibujar desde el punto (i,0) hasta el punto (i, altura)
        A = str(i);
        l_x = new IFLabel (labx, i, 10);
        c.add(l_x);
        

    }
}

public void horizontal(){      //funcion para las lineas horizontales
    for (int i=0; i<height; i+=espacio) {        //el contador se inicia en 0, va a iterar mientras i sea menor a la altura de la ventana, a i se le agraga el espacio 
        line(0, i, width,i);                            //la linea se dibuja con los puntos cuyas abcisas son los extremos de la ventana y las ordenadas toman el valor actual de i
    }
}

public void draw() {
    background(255);
    c.remove(l_x);
    vertical();
    horizontal();
}


  public void settings() { size(800, 600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "T5" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
