using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBAccess;

namespace Mashaweer
{
    public static class MashaweerDatabaseHandler
    {
        public static List<T> Search<T>(System.Linq.Expressions.Expression<Func<T, bool>> pWhereCondition) where T : class
        {
            return new DBDataContext().Search<T>(pWhereCondition);
        }
        public static List<T> GetAll<T>() where T : class, System.ComponentModel.INotifyPropertyChanged
        {
            return new DBDataContext().GetAll<T>();
        }
        public static T Single<T>(object pPrimaryKey) where T : class, System.ComponentModel.INotifyPropertyChanged
        {
            return new DBDataContext().Single<T>(pPrimaryKey);
        }
        public static bool Delete<T>(object pPrimaryKey) where T : class, System.ComponentModel.INotifyPropertyChanged
        {
            return new DBDataContext().Delete<T>(pPrimaryKey);
        }
        public static bool Delete<T>(this T pDeletedObject) where T : class, System.ComponentModel.INotifyPropertyChanged
        {
            return pDeletedObject.Delete(new DBDataContext());
        }
        public static object Insert<T>(this T pInsertedObject) where T : class, System.ComponentModel.INotifyPropertyChanged
        {
            return pInsertedObject.Insert(new DBDataContext());
        }
        public static bool Update<T>(this T pUpdateedObject) where T : class, System.ComponentModel.INotifyPropertyChanged
        {
            return pUpdateedObject.Update(new DBDataContext());
        }      
    }
}
