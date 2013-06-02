class Reserva
!!!168709.java!!!	Reserva()
		
!!!168837.java!!!	Reserva(inout date : Fecha, in name : String, in numComensales : int, inout listaMesas : ArrayList<Mesa>)
		this.fecha = date;
		this.nombre = name;
		this.numeroDeComensales = numComensales; 
		this.mesas = listaMesas;
	
!!!168965.java!!!	getNombre() : String
		return this.nombre;
!!!169093.java!!!	getFecha() : Fecha
		return this.fecha;
!!!169221.java!!!	compareTo(inout o : Reserva) : int
		if (o!= null){
			if (this.fecha.esMayorQue(o.fecha))
				return 1;
			else if (this.fecha.equals(o.fecha))
				return 0;
			else return -1;
		}return -1;
!!!169349.java!!!	toString() : String
		String name = "";
		name += "Nombre: " + this.nombre + LINE_SEPARATOR + "Fecha: " + this.fecha.toString() + LINE_SEPARATOR;
		if (mesas != null){
			name += "Mesas: ";
			for (Mesa m : this.mesas) 
				name += m.getNumeroMesa() + " ";
		}
		name += "Numero de comensales" + this.numeroDeComensales;
		return name;
!!!169477.java!!!	crearPanel() : void
		// TODO Auto-generated method stub
		
