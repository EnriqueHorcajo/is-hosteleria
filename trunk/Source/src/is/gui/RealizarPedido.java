package is.gui;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

@SuppressWarnings("serial")
public class RealizarPedido extends JPanel {

	public RealizarPedido(){
		this.setLayout(new BorderLayout());
		JPanel tipoPlato = new JPanel();
		tipoPlato.setLayout(new GridLayout(4,1));
		tipoPlato.add(new JButton("Bebidas"){
			{
				this.addActionListener(new ActionListener(){

					@Override
					public void actionPerformed(ActionEvent e) {
						panelCentral.add(new PlatosPanel(0));

					}
					
				});
			}
		});
		tipoPlato.add(new JButton("Primeros"){
			{
				this.addActionListener(new ActionListener(){

					@Override
					public void actionPerformed(ActionEvent e) {
						panelCentral.add(new PlatosPanel(1));

					}
					
				});
			}
		});
		tipoPlato.add(new JButton("Segundos"){
			{
				this.addActionListener(new ActionListener(){

					@Override
					public void actionPerformed(ActionEvent e) {
						panelCentral.add(new PlatosPanel(2));
						
					}
					
				});
			}
		});
		tipoPlato.add(new JButton("Postres"){
			{
				this.addActionListener(new ActionListener(){

					@Override
					public void actionPerformed(ActionEvent e) {
						panelCentral.add(new PlatosPanel(3));

					}
					
				});
			}
		});
		panelCentral = new JPanel();
		this.add(tipoPlato, BorderLayout.WEST);
		JFrame frame = new JFrame("Realizar Pedido");

		frame.setVisible(true);
		//frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		frame.add(this);
		frame.pack();

	}
	
	
	
	
	
	JPanel panelCentral;
	private PlatosPanel platosPanel;
	private JScrollPane scroller;
	
}