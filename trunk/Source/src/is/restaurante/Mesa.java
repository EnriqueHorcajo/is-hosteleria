package is.restaurante;

import is.restaurante.consumicion.Consumicion;

import java.util.ArrayList;
import java.util.Vector;

/**
 * Contiene la información relativa a la mesa, con la lista de comandas y el
 * número de identificación de la mesa. Permite añadir comandas y generar la
 * factura correspondiente a la mesa.
 * 
 * @author Villarin
 */
public class Mesa implements MesaInfo {

	 public Mesa(int num){
		 this.obs = new ArrayList<MesaObserver>();
         this.comandas = new Vector<Comanda>();
         this.setNumeroMesa(num);
 }
	public Mesa(int num, int cap) {
		numeroMesa = num;
		capacidad = cap;
		 this.obs = new ArrayList<MesaObserver>();
         this.comandas = new Vector<Comanda>();
	}

	public void addPedido(Comanda comanda) {
		comandas.add(comanda);
		// comandas.
	}

	// TODO editComanda, selectComanda delete Comanda

	@Override
	public int getNumeroMesa() {
		return numeroMesa;
	}

	public void setNumeroMesa(int numeroMesa) {
		this.numeroMesa = numeroMesa;
	}

	public void setCapacidad(int c) {
		capacidad = c;
	}

	public String generarFactura() {
		String factura = "";
		// TODO tenemos que usar la clase Factura, con su metodo estatico;
		/*
		 * for (Comanda c : comandas){ factura += c.toString() + LINE_SEPARATOR;
		 * } //return comandas.toString(); return factura;
		 */
		return "";
	}

	@Override
	// TODO igual habria que crear un metodo que pasara del vector a un array[]
	public ComandaInfo[] getListaComandas() {
		if (this.comandas != null)
			return this.listaComandasToArray();
		else
			return null;
	}


    private ComandaInfo[] listaComandasToArray(){
            ComandaInfo[] comandaArray = new ComandaInfo[comandas.size()];
            for (int i=0; i<comandas.size(); i++){
                    comandaArray[i] = new Comanda();
                    comandaArray[i] = comandas.get(i);
            }
            return comandaArray;
    }
	/**
	 * Escoge una comanda como actual, para realizar acciones sobre ella
	 * 
	 * @param comandaSelected
	 */
	public void avisaComanda(int comandaSelected) {
		if (comandaActual != -1)
			// TODO, al dar al boton de generar comanda o elegir comanda en la
			// vista correspondiente, se añadira el observador (supongo)
			// comandaActual.removeObserver(obs);
			// comandas.get(comandaSelected).addObserver(obs);
			comandaActual = comandaSelected;
	}

	public void eliminaComanda(int comandaSelected) {
		comandas.remove(comandaSelected);
		for (int i=0; i<comandas.size(); i++){
			comandas.get(i).setNumComanda(i);
		}
		emitirCambios();
	}

	public void addConsumption(int numComanda, Consumicion plato,
			TipoPlatos tPlato) {
		// comandas.get(numComanda).addConsumicion(plato);
		switch (tPlato) {
		case PRIMERO:
			comandas.get(numComanda).addPrimero(plato);
		case SEGUNDO:
			comandas.get(numComanda).addSegundo(plato);
		case POSTRE:
			comandas.get(numComanda).addPostre(plato);
		case BEBIDA:
			comandas.get(numComanda).addBebida(plato);
		}
	}
	
	public void addConsumption(int numComanda, Consumicion plato,
			TipoPlatos tPlato, int veces) {

		comandas.get(numComanda).setConsumicionTimes(plato, veces);
	}


	static final String LINE_SEPARATOR = System.getProperty("line.separator");

	private void emitirCambios() {
		for (MesaObserver o : obs)
			o.cambioOcurrido((ComandaInfo[]) comandas.toArray());
	}
	
	 public void addComandaObserver(ComandaObserver observer) {
         Comanda nuevaComanda = new Comanda();
         comandas.add(nuevaComanda);
         comandas.lastElement().addObserver(observer);
 }

	private ArrayList<MesaObserver> obs;
	private Vector<Comanda> comandas;
	private int numeroMesa;
	private int capacidad;
	private int comandaActual = -1;


}
