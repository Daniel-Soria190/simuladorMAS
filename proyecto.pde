// Variables
// vectores de datos importados
float[] x, velocidad, aceleracion, fuerza, labx, laby, ejex, ejey; ////
// magnitudes exportadas
float distancia, amplitud, masa, carga, ancho, alto;




int frame = 0; //<>//

void cargaDatos(){
    String[] renglones = loadStrings("datos.csv");
    int numDatos = renglones.length;
    x = new float[numDatos]; //<>//
    velocidad = new float[numDatos]; //<>//
    aceleracion = new float[numDatos]; //<>//
    fuerza = new float[numDatos]; //<>//
    //cargar los datos
    for (int i = 0; i < numDatos; ++i) {
        String[] dato = split(renglones[i], ',');
        x[i] = float(dato[0]);
        velocidad[i] = float(dato[1]);
        aceleracion[i] = float(dato[2]);
        fuerza[i] = float(dato[3]);
    }
}

// float posX(float _x){
//     return(width/2 + 2*(width*_x));
// }

float posX(float _x){
    return(((_x*width)/ancho)+(width/2));
}

float posy(float _y){
    return(((_y*height)/alto)+(height/2));
}

void calculaLabs(){
    float espx, espy;
    espx = amplitud/11;
    espy = distancia/11;
    for (int i = 0; i <= 10; ++i) {
        labx[i] = (-amplitud)+(espx*i);
        laby[i] = (-distancia/2)+(espy*i);
    }
}

void dibujaEjes(){
    fill(0,0,0);
    float espx, espy;
    espx = width/10;
    espy = height/10;
    for (int i = 0; i <= 10; ++i) {
        line(i*espx, 0, i*espx, height);
        line(0, espy*i, width, espy*i);
    }
}


void setup() {
    size(1024, 1024);
    amplitud = 0.1;
    distancia = 1 ;
    ancho = (2*amplitud);
    alto = (distancia);
    cargaDatos(); //<>//
    frameRate(120);
}

void draw() {
    background(255, 255, 255); //<>//
    dibujaEjes();
    fill(0, 255, 255);
    if (frame >= x.length) {
        frame = 0;
    }
    circle(posX(x[frame]), posy(0), 15);
    fill(255,0,0);
    circle(posX(0), posy(-distancia/2),15);
    circle(posX(0), posy(distancia/2),15);
    frame ++;
}
