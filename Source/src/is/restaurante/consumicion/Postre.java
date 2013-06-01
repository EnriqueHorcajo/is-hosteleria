package is.restaurante.consumicion;

public class Postre implements Consumicion {

	@Override
	public float getPrecio() {
		return this.precio;
	}

	@Override
	public String getNombre() {
		return this.nombre;
	}

	@Override
	public String getDescripcion() {
		return this.descripción;
	}

	@Override
	public boolean isDisponible() {
		return this.disponible;
	}
	
	private String descripción;
	private String nombre;
	private float precio;
	private boolean disponible;

}