class VistaMesas
!!!155781.java!!!	VistaMesas(inout controller : GUIController)
		this.restController = controller;
		this.mesas = this.restController.requestMesas();
		this.comandasPanel = new JPanel();
		comandasPanel.setLayout(new FlowLayout());
		JPanel panelMesas = new JPanel();
		panelMesas.setLayout(new FlowLayout());
		//this.restController.requestMesas();
		//this.restController.pedirMesas();

		for (int i=0; i<mesas.length; i++){
			final int j= i;//para que pueda ser utilizado por el listener

			JButton mesa = new JButton("Mesa " + mesas[i].getNumeroMesa());
			mesa.addActionListener(new ActionListener(){

				@Override
				public void actionPerformed(ActionEvent e) {
					numMesa = j;
					comandas = restController.getMesa(j).getListaComandas();
					setComandasPanel();
				}
				
			});
		}
		
		
!!!155909.java!!!	setComandasPanel() : void
		for (int i=0; i<comandas.length; i++){
			final int j = i;
			JButton comandaMesa = new JButton("Comanda " + i+1);
			comandaMesa.addActionListener(new ActionListener(){

				@Override
				public void actionPerformed(ActionEvent e) {
					comandaSelected = j;
					restController.avisaComanda(numMesa, comandaSelected);
				}
				
			});
		}
!!!155653.java!!!	initializeGUI() : void
		this.setLayout(new BorderLayout());
		menuBar = new JMenuBar();
		JMenu menu = new JMenu("File");
		menuBar.add(menu);
		JMenuItem quit = new JMenuItem("Quit");
		menu.add(quit);
		quit.addActionListener(new ActionListener(){

			@Override
			public void actionPerformed(ActionEvent e) {
				CloseApp.quitApp();		
			}
			
		});
		this.setJMenuBar(menuBar);	
		
		ImageIcon kike = createImageIcon("images/kikeHost2.png", "KIKE");
		logo = new JLabel(kike);
		logo.setSize(20, 20);

		this.add(logo, BorderLayout.NORTH);
		front = new JPanel();
		front.setLayout(new GridLayout(3,1, 3, 3));
		//front.setLayout(new FlowLayout(3));
		JPanel usuario = new JPanel();

		usuario.setLayout(new GridLayout(2,1));
		//usuario.setLayout(new FlowLayout(2));
		
		JPanel contrasena = new JPanel();
		contrasena.setLayout(new GridLayout(2,1));
		//contrasena.setLayout(new FlowLayout(2));
		
		JLabel textoUsuario = new JLabel("USUARIO");
		textoUsuario.setOpaque(true);
		usuario.add(textoUsuario, BorderLayout.NORTH);
		user = new JTextField(10);
		usuario.add(user);
		
		JLabel textoContrasena = new JLabel("CONTRASEÑA");
		textoUsuario.setOpaque(true);
		contrasena.add(textoContrasena, BorderLayout.NORTH);
		password = new JPasswordField(10);
		password.getPassword();
		
		contrasena.add(password);
		front.add(usuario);
		front.add(contrasena);

		front.add(new JButton(/*"Entrar"*/ "Jaime conectate al puto gchat") {
			{
				this.addActionListener(new ActionListener() {

					@Override
					public void actionPerformed(ActionEvent e) {
						//if (!user.getText().isEmpty()){
							//if(registroCorrecto()) 
						mostrarRestaurante();
							/*
							if (controler.buscaCliente(user.getText())){
								if (controler.getCliente(user.getText()).passWord(password.getPassword())){
									password.setText(null);
									controller.iniciaSesion(user.getText());
								}else showMessage("Usuario o contraseña incorrectos");
								
							}else showMessage("Usuario o contraseña incorrectos");
							*/
						//}
						
					}

				
				});
				
			}

		});
		this.add(front);
		
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		//RestauranteSwing rest = new RestauranteSwing(new Restaurante());
		//RestauranteSwing rest = new RestauranteSwing();
		
!!!155781.java!!!	UserWindow(inout controller : GUIController)
	
		super("KIKE HOSTELERIA S.A.");
		this.controlador = controller;
		this.setSize(800, 600);
		initializeGUI();
		usuarios = new Usuario[1];
		usuarios[0] = new Usuario("Scrugo", "huelomal");
		setDefaultCloseOperation(EXIT_ON_CLOSE);
	
!!!155909.java!!!	mostrarRestaurante() : void

		this.remove(logo);

		this.remove(front);
		this.setSize(400,300);
		RestauranteSwing rest = new RestauranteSwing(controlador);
		this.add(rest);
		
!!!156037.java!!!	registroCorrecto() : boolean
		boolean b = false;
	//	for (Usuario u : usuarios)
			for (int i = 0; i< usuarios.length && !b; i++){
				if (user.getText().equals(usuarios[i].getId()) && passwordCorrecto(password.getPassword(), usuarios[i].getPassword()))  b = true;
			}
		return b;
!!!156165.java!!!	passwordCorrecto(inout p1 : char, inout p2 : char) : boolean
		boolean b = true;
		if (p1.length != p2.length) return false;
		else for (int i = 0; i < p1.length && b; i++){
			if (p1[i] != p2[i]) b = false;
	
		}
		return b;
		
		
!!!156293.java!!!	createImageIcon(in path : String, in description : String) : ImageIcon
		java.net.URL imgURL = getClass().getResource(path);
		if (imgURL != null) {
			return new ImageIcon(imgURL, description);
		} else {
			System.err.println("Couldn't find file: " + path);
			return null;
		}
