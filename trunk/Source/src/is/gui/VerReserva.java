package is.gui;

import is.Fecha;
import is.restaurante.LibroReservaObserver;
import is.restaurante.Reserva;
import is.restaurante.ReservaInfo;

import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;


/**
 *Muestra cuatro pestañas con las reservas de hoy, dentro de una semana, dentro de un mes y todas las reservas.
 * @author JaimeDan
 */

public class VerReserva implements LibroReservaObserver{

	@SuppressWarnings("serial")
	public VerReserva(GUIController rest) {
		inicializaTabla();
		JTable tTodas = new JTable(tablaTodas);
		JTable tHoy = new JTable(tablaHoy);
		JTable tSemana = new JTable(tablaSemana);
		JTable tMes = new JTable(tablaMes);
		tTodas.setPreferredScrollableViewportSize(null);
		tHoy.setPreferredScrollableViewportSize(null);
		tSemana.setPreferredScrollableViewportSize(null);
		tMes.setPreferredScrollableViewportSize(null);
		tTodas.setPreferredScrollableViewportSize(null);
		//Permitimos que se pueda hacer Scroll por si se cogen muchos Items
		JScrollPane scrollTodas  = new JScrollPane(tTodas, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED, JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
		JScrollPane scrollHoy  = new JScrollPane(tHoy, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED, JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
		JScrollPane scrollSemana  = new JScrollPane(tSemana, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED, JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
		JScrollPane scrollMes = new JScrollPane(tMes, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED, JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);

		this.controlador = rest;
		this.controlador.addLibroReservaObserver(this);
		
		JTabbedPane tabbedPane = new JTabbedPane();
		
		JPanel panelTodas = new JPanel();
		panelTodas.add(scrollTodas);
		JFrame v = new JFrame();
		JPanel p = new JPanel();
		v.add(p);
		p.add(scrollTodas);
		v.setSize(300,200);
		v.add(tTodas);
		v.setVisible(true);
		tabbedPane.addTab("Todas", null, panelTodas, "Muestra todas las reservas");
		panelTodas.add(new JLabel("prueba"));
		/*for ( ReservaInfo r : controlador.getReservas(-1)){
			JTextArea jt = new JTextArea(r.toString());			
			panelTodas.add(jt);
		}*/
		
		JPanel panelHoy = new JPanel();
		tabbedPane.addTab("Hoy", null, panelHoy, "Muestra las reservas de hoy");
		panelHoy.add(tHoy);
		/*for ( ReservaInfo r : controlador.getReservas(0)){
			JTextArea jt = new JTextArea(r.toString());			
			panelHoy.add(jt);
		}*/
		
		JPanel panelSemana = new JPanel();
		tabbedPane.addTab("Esta semana",null, panelSemana,
		                  "Muestra las reservas de esta semana");
		panelSemana.add(tSemana);
		/*for ( ReservaInfo r : controlador.getReservas(1)){
			JTextArea jt = new JTextArea(r.toString());			
			panelSemana.add(jt);
		}*/
		
		JPanel panelMes = new JPanel();
		panelMes.setPreferredSize(new Dimension(410, 50));
		tabbedPane.addTab("Este mes", null, panelMes,
		                      "Muestra las reservas de este mes");
		panelMes.add(tMes);
		/*for ( ReservaInfo r : controlador.getReservas(2)){
			JTextArea jt = new JTextArea(r.toString());			
			panelMes.add(jt);
		}*/
		JFrame marco = new JFrame();
		
		marco.add(tabbedPane);
		marco.setVisible(true);
		marco.setSize(150, 150);
	}
	
	private void inicializaTabla(){
		tablaTodas = new TableReservas();
		tablaHoy = new TableReservas();
		tablaSemana = new TableReservas();
		tablaMes = new TableReservas();
	}
	private GUIController controlador;
	private JTextField nombreReserva;
	
	@Override
	public void cambioOcurrido(ReservaInfo[] reservas) {
		// TODO Auto-generated method stub
		
	}
	TableReservas tablaTodas;
	TableReservas tablaHoy;
	TableReservas tablaSemana;
	TableReservas tablaMes;
}
