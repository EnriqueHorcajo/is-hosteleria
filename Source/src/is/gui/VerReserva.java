package is.gui;

import is.restaurante.Reserva;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class VerReserva {

	@SuppressWarnings("serial")
	public VerReserva(GUIController rest) {
		this.controlador = rest;
		JPanel panel = new JPanel();
		JLabel nombre = new JLabel("Introduzca su nombre");
		nombreReserva = new JTextField();
		panel.setLayout(new GridLayout (3,1));
		panel.add(nombre);
		panel.add(nombreReserva);

		
		panel.add(new JButton("Buscar"){
			{
				this.addActionListener(new ActionListener(){

					@Override
					public void actionPerformed(ActionEvent e) {
						ArrayList<Reserva> listaReservas = controlador.reservasDeUnCliente(nombreReserva.getText());
						for (Reserva r : listaReservas) r.crearPanel(); 
						// TODO AYUDA!! haciendo eso te cargas el mvc pero si no lo hacer tienes que crear mil getters y setters						
					}
					
				});
			}
		});
		
		
		JFrame marco = new JFrame();
		marco.add(panel);
		marco.setVisible(true);
		marco.setSize(150, 150);
	}

	
	private GUIController controlador;
	private JTextField nombreReserva;
}