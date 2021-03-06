using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Interfaces
{
    public interface IRepository<TEntity> where TEntity : class
    {
        IEnumerable<TEntity> GetAll();

        TEntity FindById(object Id);
        void Add(TEntity entity);
        void Update(TEntity entity);
        void UpdateIgnore(TEntity entity, string ignoreCol);

        void Remove(TEntity entity);
        void Delete(object id);
        int SaveChange();
    }
}
