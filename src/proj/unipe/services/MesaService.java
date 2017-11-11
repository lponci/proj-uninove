package proj.unipe.services;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import proj.unipe.bd.JPAUtil;
import proj.unipe.daos.MesaDAO;
import proj.unipe.entities.Mesa;

//classe respons�vel por realizar as opera��es da aplica��o, ela utiliza-se do MesaDAO
//para passar a instancia do manager que � pedida ao JPAUtil no construtor, apos pedir a instancia do manager ao
//JPAUtil no construtor � instanciado MesaDAO e passa a instancia do manager para a classe MesaDAO e a classe MesaDAO
//� respons�vel por passar a instancia do manager ao abstractDAO para que ele utilize-se dessa instancia para de fato
//chamar os metodos respons�veis por inserir, alterar, remover, listar, entre outros.
@Service
@Transactional
public class MesaService {

	@Autowired
	private MesaDAO mesaDAO;

	public void inserir(Mesa mesa) {

		mesaDAO.inserir(mesa);

	}

	public void atualizar(Mesa mesa) {

		mesaDAO.atualizar(mesa);

	}

	public void excluir(Mesa mesa) {

		mesaDAO.excluir(mesa);

	}

	public Mesa buscarPorId(Long id) {

		Mesa mesa = null;

		mesa = (Mesa) mesaDAO.buscarPorID(id);

		return mesa;

	}

	// m�todo para realizar a busca por numero da mesa com CRITERIA
	public List<Mesa> buscaPorNumMesa(int numero) {

		List<Mesa> mesas = null;

		mesas = mesaDAO.buscaPorNumMesa(numero);

		return mesas;

	}
	
	public List<Mesa> buscaPorMesaDeReserva(boolean b) {
		
		List<Mesa> mesas = null;

		mesas = mesaDAO.buscaPorMesaDeReserva(b);

		return mesas;
		
		
	}
	
	

	public List<Mesa> listar() {

		List<Mesa> mesas = null;

		mesas = mesaDAO.listar();

		return mesas;

	}

}
