class PlatosPanel
!!!151045.java!!!	PlatosPanel(inout rest : Restaurante)
		this.menu = rest.getMenu();

	//	this.setLayout(new GridLayout(2, 1));

		//TODO el grid layout tiene que tener el tamaño del menu que corresponda, pero ponemos un ancho fijo
		this.setLayout(new GridLayout(4, 11));

		
!!!151173.java!!!	PlatosPanel(inout rest : GUIController)
		
!!!151301.java!!!	PlatosPanel(in i : int, inout rest : GUIController)
		this.menu = rest.getMenu();
		// TODO Denotamos 0 bebidas 1 primero 2 segundo 3 postre
		if (i == 0) platos = menu.getBebidas();
		else if(i == 1) platos = menu.getPrimeros();
		else if (i == 2)platos = menu.getSegundos();
		else if (i == 3) platos = menu.getPostres();
		generarPanel();
!!!151429.java!!!	generarPanel() : void
		// TODO Auto-generated method stub
		celdaPlatos = new ArrayList<CeldaPlato>();
				for (Consumicion c: platos){
					CeldaPlato cp = new CeldaPlato(null, c);
					celdaPlatos.add(cp);
					this.add(cp);
				}
		//	c.generarInfo();
				
!!!152837.java!!!	ModificarMenu(inout rest : GUIController)
		// TODO Auto-generated constructor stub
