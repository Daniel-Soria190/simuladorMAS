// Variables
// vectores de datos importados
float[] x, velocidad, aceleracion, fuerza, ejex, ejey;
// magnitudes exportadas
float distancia, amplitud, masa, carga, ancho, alto;
PrintWriter output;

int frame = 0; //<>//

void setup() {
    size(1024, 1024);
    frameRate(120);
    textSize(16);
    distancia = 1;
    amplitud = 0.1;
    masa = 1.67e-27;
    carga = 1.6e-19;
    ancho = (2*amplitud);
    alto = (distancia);
    escribeDatos();
    delay(1000);
    python();
    delay(5000);
    cargaDatos();
    
}

void draw() {
    background(255, 255, 255);
    dibujaEjes();
    fill(0, 255, 255);
    if (frame >= x.length) {
        frame = 0;
    }
    circle(posX(x[frame]), posy(0), 15);
    fill(255,0,0);
    circle(posX(0), posy(-distancia/2),15);
    circle(posX(0), posy(distancia/2),15);
    fill(0,0,0);
    text(str(-amplitud),15,20+ height/2);
    text(str(amplitud),width-40,20+ height/2);
    text(str(distancia/2),15 + width/2,15);
    text(str(-distancia/2),15 + width/2,height-15);
    fill(255,255,255);
    rect(7*(width/10), 7*(height/10), 3*(width/10), 3*(height/10));
    fill(0,0,0);
    text("Fuerza = "+str(fuerza[frame]), 3*(width/4), 12*(height/16));
    text("Posicion = "+str(x[frame]), 3*(width/4), 13*(height/16));
    text("Velocidad = "+str(velocidad[frame]), 3*(width/4), 14*(height/16));
    text("Aceleracion = "+str(aceleracion[frame]), 3*(width/4), 15*(height/16));
    frame ++;
}
