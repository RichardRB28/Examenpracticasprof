#Vectores donde se almacenarán los diferentes tipos de datos
minus=[]
mayus=[]
num=[]
x=2
concat=[]
cadenas_s=input("ingrese una cadena de caracteres la cual contenga un tamanio menor que 1000 caracteres: ")

# indica el tamaño del vector si corresponde al limite establecido

tama=len(cadenas_s)
print(tama)

if tama>0 and tama<20:	#No debe exceder el tamaño predefinido

	vector_cadena =list(cadenas_s)
	print(vector_cadena)

# Ciclado para analizar cada elemento del vector de entrada y clasificarlos
#por tipo, para analizar los digitos se realiza la conversión a enteros  debido
# a que los datos ingresados son tomados como caracteres.

	for elemento in vector_cadena:

		if elemento.isupper():
			mayus.append(elemento)
		#	print("la letra es mayuscula")
		elif elemento.islower():
			minus.append(elemento)
		#	print("la letra es minuscula")
		elif elemento.isdigit():
			num.append(int(elemento))
		#	print("la entrada es un numero")

# Ordenamiento de cada tipo de dato, para luego concatenarlos e imprimirlos 
	may=sorted(mayus)
	min=sorted(minus)
	numeor=sorted(num,key=lambda nume:(nume%2==0,nume))
	cadena=" ".join(str(nu) for nu in numeor) 
	concat=min+may
	print(" ".join(concat),cadena,)

else:
	print("el tamaño no es valido")


