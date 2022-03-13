using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository;
using Entities;
using DomainModel;

namespace Services.Interfaces
{
    public interface IMasterServices
    {
        IEnumerable<StatusMaster> GetStatusMaster();
        IEnumerable<DDLMaster> GetDDLMaster(string Type);
        IEnumerable<Districts> GetDistricts();
        IEnumerable<Talukas> GetTalukas(int DistrictId);
        IEnumerable<Villages> GetVillages(int TalukaId);
       
    }
}
