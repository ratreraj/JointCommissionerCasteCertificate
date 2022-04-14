using Microsoft.EntityFrameworkCore;
using Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Implementations
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        protected DbContext _db;
        public Repository(DbContext dbContext)
        {
            _db = dbContext;
        }
        public void Add(TEntity entity)
        {
            _db.Set<TEntity>().Add(entity);
        }

        public void Remove(TEntity entity)
        {
            _db.Set<TEntity>().Remove(entity);
        }

        public void Delete(object id)
        {
            TEntity entity = _db.Set<TEntity>().Find(id);
            if (entity != null)
                _db.Set<TEntity>().Remove(entity);
        }

        public TEntity FindById(object Id)
        {
            TEntity entity = _db.Set<TEntity>().Find(Id);
            return entity;
        }

        public IEnumerable<TEntity> GetAll()
        {
            IEnumerable<TEntity> entities = _db.Set<TEntity>().ToList();
            return entities;
        }

        public int SaveChange()
        {
            return _db.SaveChanges();
        }

        public void Update(TEntity entity)
        {
            _db.Set<TEntity>().Update(entity);

        }

        public void UpdateIgnore(TEntity entity, string ignoreCol)
        {
            _db.Entry(entity).State = EntityState.Modified;
            _db.Entry(entity).Property(ignoreCol).IsModified= false;
        }


    }
}
