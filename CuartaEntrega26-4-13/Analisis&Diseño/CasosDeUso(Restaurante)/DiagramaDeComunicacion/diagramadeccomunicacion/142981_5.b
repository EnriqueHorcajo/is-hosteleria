class ConsumicionSwing
!!!148741.java!!!	ConsumicionSwing(inout controller : GUIController, in name : String, inout edit : boolean)
		this.setLayout(new FlowLayout());
		JLabel nombreL = new JLabel("Nombre");
		this.add(nombreL);
		
		/*this.restControl = controller;
		this.platoName = name;
		
		this.setLayout(new BorderLayout());
		
		JPanel nombre = new JPanel();
		nombre.setLayout(new FlowLayout());
		
			JLabel nombreL = new JLabel("Nombre");
			nombreL.setBorder(BorderFactory.createDashedBorder(Color.black));
			
			nombrePlato = new JTextField();
			
			nombre.add(nombreL);
			nombre.add(nombrePlato);
		this.add(nombre, BorderLayout.NORTH);
		
		JPanel descripcion = new JPanel();
			JLabel descripcionL = new JLabel("Descripción");
			nombreL.setBorder(BorderFactory.createDashedBorder(Color.black));
			
			this.descripcion = new JTextArea();
			
			descripcion.add(nombreL);
			descripcion.add(nombrePlato);
			
		JPanel precioP = new JPanel();
			JLabel precioL = new JLabel("Precio");
			nombreL.setBorder(BorderFactory.createDashedBorder(Color.black));
			
			this.precioField = new JTextField();
			
			precioP.add(precioL);
			precioP.add(precioField);*/
		
!!!149253.java!!!	ConsumicionSwing(inout ventana : VerMenu, inout controller : GUIController, inout consumicion : Consumicion, inout edit : boolean)
		
		this.edit = edit;
		this.campos = new JPanel();
		this.setLayout(new BorderLayout());
		
		anyadirControles();
		this.campos.setLayout(new SpringLayout());
		consumicionInicial = consumicion;
		this.ventanaGeneral = ventana;
		this.restControl = controller;
		
		/*********Campo nombre***********************/
		JLabel nombreL = new JLabel(" Nombre ");
		nombreL.setBorder(BorderFactory.createLineBorder(Color.black));
		
		this.campos.add(nombreL);
		if(edit)
			nombrePlato = new JTextField(consumicion.getNombre());
		else
			nombrePlato = new JTextField();

		nombrePlato.setMaximumSize(new Dimension(1, 1));
		this.campos.add(nombrePlato);
		
		/**********Campo descripcion******************/
		JLabel descripcionL = new JLabel(" Descripción ");
		descripcionL.setBorder(BorderFactory.createLineBorder(Color.black));
		this.campos.add(descripcionL);
		if(edit)
			this.descripcion = new JTextArea(consumicion.getDescripcion());
		else
			this.descripcion = new JTextArea();
				
		this.campos.add(this.descripcion);
			
		/**********Campo precio***********************/
		JLabel precioL = new JLabel(" Precio ");
		precioL.setBorder(BorderFactory.createLineBorder(Color.black));
	
		this.campos.add(precioL);
		if(edit)
			this.precioField = new JTextField(Float.toString(consumicion.getPrecio()));
		else
			this.precioField = new JTextField();
		
		precioField.setMaximumSize(new Dimension(1, 1));	
		this.campos.add(precioField);
		
		/*************Campo tipo**********************/
		JLabel tipoL = new JLabel(" Tipo ");
		tipoL.setBorder(BorderFactory.createLineBorder(Color.black));
		
		this.campos.add(tipoL);
		TipoPlatos[] arrayTipos = TipoPlatos.values();
		Vector<TipoPlatos> vectorTipos = new Vector<TipoPlatos>();
		for(TipoPlatos t: arrayTipos){
			vectorTipos.add(t);
		}
		tipoPlato = new JComboBox<TipoPlatos>(vectorTipos);
		
		tipoPlato.setMaximumSize(new Dimension(1, 1));	
		this.campos.add(tipoPlato);
		
		/**************Campo disponible*****************/
		
		JLabel disponibleL = new JLabel(" Disponible ");
		disponibleL.setBorder(BorderFactory.createLineBorder(Color.black));
		
		this.campos.add(disponibleL);
		disponible = new JRadioButton();
		disponible.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(disponible.isSelected())
					textoDisponibilidad.setText("Plato disponible");
				else
					textoDisponibilidad.setText("Plato no disponible");		
			}
		});
		

		contenerDisponibilidad = new JPanel();
		contenerDisponibilidad.setMaximumSize(new Dimension(1, 1));	
		contenerDisponibilidad.add(disponible);
		textoDisponibilidad = new JLabel("Disponibilidad del plato");
		contenerDisponibilidad.add(textoDisponibilidad);
		this.campos.add(contenerDisponibilidad);
		/*************Configuracion final***************/
		SpringUtilities.makeCompactGrid(campos, 5, 2, 6, 6, 10, 10);
		this.add(campos, BorderLayout.CENTER);
!!!149381.java!!!	anyadirControles() : void
		JButton done = new JButton("done");
		done.addActionListener(new ActionListener(){				
			@Override
			public void actionPerformed(ActionEvent e) {
				if(nombrePlato.getText().isEmpty())
					notificar("Debe indicar un nombre de plato");
				else if(descripcion.getText().isEmpty())
					notificar("Debe decribir el plato");
				else if(precioField.getText().isEmpty())
					notificar("Debe indicar un precio");
				else if(!isNumber(precioField.getText()))
					notificar("El precio debe ser un numero");
				else
					guardarPlato();					
			}
		});
		JButton cancel = new JButton("cancel");
		cancel.addActionListener(new ActionListener(){				
			@Override
			public void actionPerformed(ActionEvent e) {
				ventanaGeneral.devolverControlPrincipal();					
			}
		});
		JPanel controles = new JPanel();
		controles.setLayout(new GridLayout());
		controles.add(done);
		controles.add(cancel);
		this.add(controles, BorderLayout.SOUTH);
		
!!!149509.java!!!	nuevaConsumicion() : Consumicion
		TipoPlatos tipo = (TipoPlatos) tipoPlato.getSelectedItem();
		switch (tipo) {
		case BEBIDA:
			return new Bebida(nombrePlato.getText(), Float.parseFloat(precioField.getText()),disponible.isSelected(),  descripcion.getText());
		case PRIMERO:
			return new Plato(nombrePlato.getText(), Float.parseFloat(precioField.getText()),disponible.isSelected(),  descripcion.getText());
		case SEGUNDO:
			return new Plato(nombrePlato.getText(), Float.parseFloat(precioField.getText()),disponible.isSelected(),  descripcion.getText());
		case POSTRE:
			return new Postre(nombrePlato.getText(), Float.parseFloat(precioField.getText()),disponible.isSelected(),  descripcion.getText());
		default:
			return consumicionInicial;
		}
!!!149637.java!!!	guardarPlato() : void
		/*Esta funcion actualiza en el menu el plato cambiado
		 * le pasa el antiguo y el nuevo
		 */
		if(edit)
			restControl.actualizaConsumicion(consumicionInicial, nuevaConsumicion(), (TipoPlatos) tipoPlato.getSelectedItem());
		else
			restControl.addConsumicion(nuevaConsumicion(), (TipoPlatos) tipoPlato.getSelectedItem());
		ventanaGeneral.devolverControlPrincipal();
!!!149765.java!!!	notificar(in message : String) : void
		JOptionPane.showMessageDialog(this, message);
!!!149893.java!!!	isNumber(in palabra : String) : boolean
		try{
			Float.parseFloat(palabra);
		}catch( NumberFormatException n){
			return false;
		}
		return true;
