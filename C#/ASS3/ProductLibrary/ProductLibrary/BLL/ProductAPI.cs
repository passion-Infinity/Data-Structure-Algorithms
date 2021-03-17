using ProductLibrary.DAL;
using System.Data;

namespace ProductLibrary.BLL
{
    public class ProductAPI
    {
        ProductDAO dal;

        public ProductAPI()
        {
            dal = new ProductDAO();
        }
        public DataSet GetAll()
        {
            return dal.GetAll();
        }

        public DataSet FindBySearch(string name)
        {
            return dal.FindByName(name);
        }

        public bool Insert(Product product)
        {
            return dal.Insert(product);
        }

        public bool Update(Product product)
        {
            return dal.Update(product);
        }
        public bool Delete(int id)
        {
            return dal.Delete(id);
        }
    }
}
