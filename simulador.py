import numpy as np
import matplotlib.pyplot as plt
# import pandas as pd
# Nota : la amplitud de be de ser menor a la distancia entre cargas
k = 8.9876e9
d = 1
q_12 = 1.6e-19
q_3 = -1.6e-19
m = 1.67e-27
amplitud = 0.1
omega = 4*np.sqrt(np.absolute(k*q_12*q_3)/(m*(d**3)))
periodo = (np.pi*np.sqrt(m*(d**3)))/(2*np.sqrt(np.absolute(k*q_12*q_3)))
fps = 120
intervalo = 1/fps

# Posicion con respecto al tiempo
pos = lambda t: amplitud*np.cos(omega*t)

# Velocidad con respecto al tiempo
vel = lambda t : -omega*amplitud*np.sin(omega*t)

# Aceleracion con respecto al tiempo
ace = lambda t : -(omega**2)*amplitud*np.cos(omega*t)

# Calcular los fotogramas
fotogramas = int(periodo*fps)
tiempo = np.linspace(0, periodo, fotogramas)

x = pos(tiempo)
aceleracion = ace(tiempo)
velocidad = vel(tiempo)
fuerza = m*aceleracion
y=np.zeros(len(x))

np.savetxt('datos.csv',np.array((x,velocidad,aceleracion,fuerza)).T,delimiter=',')

# graficas posicion, velocidad y aceleracion
plt.figure()
plt.grid()
plt.plot(tiempo, x, label='$x(t)$')
plt.plot(tiempo,velocidad, label='$v(t)$')
plt.plot(tiempo,aceleracion, label='$a(t)$')
plt.legend(title='Funciones')
plt.xlabel('t')
plt.ylabel('x')
# plt.show()

# grafica fuerza
plt.figure()
plt.grid()
plt.plot(x,fuerza, label='$F(t)$')
plt.legend(title='Fuerza')
plt.xlabel('distancia')
plt.ylabel('Newtons')
plt.show()

# # grafica animada

# fig = plt.figure()
# ax = fig.add_subplot(autoscale_on=False,xlim=(-amplitud,amplitud), ylim=(-d,d))
# # graficar frame
# def actualiza(i):
#     ax.clear()
#     ax.grid()
#     ax.set_xlabel('x')
#     ax.set_ylabel('y')
#     ax.plot(x,y)
#     ax.plot(x[i], y[i],'o',color='red')

# # Animacion
# ani = animation.FuncAnimation(fig, actualiza, range(fotogramas),interval=intervalo)

# plt.show()
