void escribeDatos(){
    output = createWriter("datos_java.csv");
    output.print(distancia+","+amplitud+","+masa+","+carga);
    output.flush();
    output.close();

}

void actualizaBasico(){
    noLoop();
    distancia = gui.slider("basico/distancia");
    amplitud = gui.slider("basico/amplitud");
    if (amplitud>distancia) {
        loop();
        fill(255,0,0);
        text("La amplitud no puede ser mayor a la distancia", width/2,height/2);
        noLoop();
    }else {
    ancho = (2*amplitud);
    alto = (distancia);
    escribeDatos();
    delay(1000);
    python();
    delay(3000);
    cargaDatos();
    loop();
    }
}

void actualizaAvanzado(){
    noLoop();
    distancia = gui.slider("avanzado/distancia");
    amplitud = gui.slider("avanzado/amplitud");
    if (amplitud>distancia) {
        loop();
        fill(255,0,0);
        text("La amplitud no puede ser mayor a la distancia", width/2,height/2);
        noLoop();
    }else {
    ancho = (2*amplitud);
    alto = (distancia);
    masa = gui.slider("avanzado/masa");
    carga = gui.slider("avanzado/carga");
    escribeDatos();
    delay(1000);
    python();
    delay(3000);
    cargaDatos();
    loop();
    }
}


void python(){
    try {
        String cmd = "./calcula.sh"; 
        Runtime.getRuntime().exec(cmd); 
    } catch (IOException ioe) {
	    System.out.println (ioe);
    }
}

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

float posX(float _x){
    return(((_x*width)/ancho)+(width/2));
}

float posy(float _y){
    return(((_y*height)/alto)+(height/2));
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
