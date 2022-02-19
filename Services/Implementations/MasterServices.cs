using Entities;
using Repository.Interfaces;
using Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Implementations
{
    public class MasterServices : IMasterServices
    {
        private readonly IRepository<StatusMaster> _statusMasterRepo;
        private readonly IRepository<DDLMaster> _dDLMasterRepo;
        private readonly IRepository<Districts> _districtsRepo;
        private readonly IRepository<Talukas> _talukasRepo;
        private readonly IRepository<Villages> _villagesRepo;

        public MasterServices(IRepository<StatusMaster> statusMaster, IRepository<DDLMaster> dDLMaster, IRepository<Districts> districts, IRepository<Talukas> talukas, IRepository<Villages> villages)
        {
            _statusMasterRepo=statusMaster;
            _dDLMasterRepo=dDLMaster;
            _districtsRepo = districts;
            _talukasRepo=talukas;
            _villagesRepo=villages;

        }
        public IEnumerable<DDLMaster> GetDDLMaster(string Type)
        {
            return _dDLMasterRepo.GetAll().Where(x=>x.Categroy==Type);
        }

        public IEnumerable<Districts> GetDistricts()
        {
            return _districtsRepo.GetAll();
        }

        public IEnumerable<StatusMaster> GetStatusMaster()
        {
            return _statusMasterRepo.GetAll();
        }

        public IEnumerable<Talukas> GetTalukas(int DistrictId)
        {
            return _talukasRepo.GetAll().Where(x => x.DistrictID==DistrictId);
        }

        public IEnumerable<Villages> GetVillages(int TalukaId)
        {
            return _villagesRepo.GetAll().Where(x => x.TalukaId==TalukaId);
        }
    }
}
