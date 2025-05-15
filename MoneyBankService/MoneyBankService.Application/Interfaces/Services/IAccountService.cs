using MoneyBankService.Domain.Entities;

namespace MoneyBankService.Application.Interfaces.Services
{
    public interface IAccountService
    {
        Task<Account> CreateAccount(Account account);

    }

}

