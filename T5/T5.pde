import interfascia.*;

GUIController c;
IFLabel[] l_x, l_y;
String labx, laby;
// int i = 0;
//declaracion de variables globales
int espacio=40;

void setup() {
    size(800,600);  //establece el lienzo de 800x600
    frameRate(120);
    c = new GUIController (this);
    l_x[] = new IFLabel (labx, 0, 0);
    // c.add (l);
}

void vertical(){        //funcion para dibujar lineas verticales
    for (int i=0; i<width; i+=espacio) {     //declara el contador inicial en 0 y mientras i sea menor al ancho de la ventana va a dibujar una linea, al contador se le incrementa el espacio
        // c.remove(l);
        line(i, 0, i, height);                //la linea se va a dibujar desde el punto (i,0) hasta el punto (i, altura)
        A = str(i);
        l_x = new IFLabel (labx, i, 10);
        c.add(l_x);
        

    }
}

void horizontal(){      //funcion para las lineas horizontales
    for (int i=0; i<height; i+=espacio) {        //el contador se inicia en 0, va a iterar mientras i sea menor a la altura de la ventana, a i se le agraga el espacio 
        line(0, i, width,i);                            //la linea se dibuja con los puntos cuyas abcisas son los extremos de la ventana y las ordenadas toman el valor actual de i
    }
}

void draw() {
    background(255);
    c.remove(l_x);
    vertical();
    horizontal();
}
