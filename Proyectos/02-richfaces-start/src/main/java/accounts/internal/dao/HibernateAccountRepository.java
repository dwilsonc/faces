package accounts.internal.dao;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import accounts.Account;

import common.money.Percentage;

/**
 * An account manager that uses Hibernate to find accounts.
 */
public class HibernateAccountRepository implements AccountRepository {

	private SessionFactory sessionFactory;

	/**
	 * Creates a new Hibernate account manager.
	 * @param sessionFactory the Hibernate session factory
	 */
	public HibernateAccountRepository(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional(readOnly = true)
	public Account findAccount(String number) {
		return (Account) getCurrentSession().
			createQuery("from Account a where a.number = ?").
			setString(0, number).uniqueResult();
	}

	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public List<Account> getAllAccounts() {
		return getCurrentSession().createQuery("from Account").list();
	}

	@Transactional(readOnly = true)
	public Account getAccount(Long id) {
		return (Account) getCurrentSession().load(Account.class, id);
	}

	@Transactional
	public void update(Account account) {
		getCurrentSession().saveOrUpdate(account);
	}

	@Transactional
	public void updateBeneficiaryAllocationPercentages(Long accountId, Map<String, Percentage> allocationPercentages) {
		Account account = getAccount(accountId);
		for (Entry<String, Percentage> entry : allocationPercentages.entrySet()) {
			account.getBeneficiary(entry.getKey()).setAllocationPercentage(entry.getValue());
		}
	}

	@Transactional
	public void addBeneficiary(Long accountId, String beneficiaryName) {
		getAccount(accountId).addBeneficiary(beneficiaryName, Percentage.zero());
	}

	@Transactional
	public void removeBeneficiary(Long accountId, String beneficiaryName, Map<String, Percentage> allocationPercentages) {
		getAccount(accountId).removeBeneficiary(beneficiaryName);
		updateBeneficiaryAllocationPercentages(accountId, allocationPercentages);
	}

	/**
	 * Returns the session associated with the ongoing reward transaction.
	 * @return the transactional session
	 */
	protected Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Transactional
	public void delete(Long id) {
		getCurrentSession().delete(getAccount(id));		
	}
}