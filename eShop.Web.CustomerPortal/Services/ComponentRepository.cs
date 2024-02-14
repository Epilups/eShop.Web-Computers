using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eShop.DataStore.SQL.Dapper;
using eShop.Web.CustomerPortal.Models;

namespace eShop.Web.CustomerPortal.Services
{
    public class ComponentRepository
    {
        private readonly IDataAccess dataAccess;

        public ComponentRepository(IDataAccess dataAccess)
        {
            this.dataAccess = dataAccess;
        }

        public IEnumerable<Cases> GetCases()
        {
            List<Cases> list;
            list = dataAccess.Query<Cases, dynamic>("SELECT * FROM [eShop2].[dbo].[cases]", new { });

            return list.AsEnumerable();
        }
        
        public IEnumerable<CaseFans> GetCaseFans()
        {
            List<CaseFans> list;
            list = dataAccess.Query<CaseFans, dynamic>("SELECT * FROM [eShop2].[dbo].[casesFans]", new { });

            return list.AsEnumerable();
        }
        
        public IEnumerable<CaseAccessory> GetCaseAccessories()
        {
            List<CaseAccessory> list;
            list = dataAccess.Query<CaseAccessory, dynamic>("SELECT * FROM [eShop2].[dbo].[casesAccessory]", new { });

            return list.AsEnumerable();
        }
        
        public IEnumerable<CPU> GetCPUs()
        {
            List<CPU> list;
            list = dataAccess.Query<CPU, dynamic>("SELECT * FROM [eShop2].[dbo].[cpu]", new { });

            return list.AsEnumerable();
        }
        
        public IEnumerable<CpuCooler> GetCPUCoolers()
        {
            List<CpuCooler> list;
            list = dataAccess.Query<CpuCooler, dynamic>("SELECT * FROM [eShop2].[dbo].[cpuCooler]", new { });

            return list.AsEnumerable();
        }
        
        public IEnumerable<HeadPhones> GetHeadphones()
        {
            List<HeadPhones> list;
            list = dataAccess.Query<HeadPhones, dynamic>("SELECT * FROM [eShop2].[dbo].[headphones]", new { });

            return list.AsEnumerable();
        }
        
        public IEnumerable<Memory> GetMemory()
        {
            List<Memory> list;
            list = dataAccess.Query<Memory, dynamic>("SELECT * FROM [eShop2].[dbo].[memory]", new { });

            return list.AsEnumerable();
        }
        
        
    }
}