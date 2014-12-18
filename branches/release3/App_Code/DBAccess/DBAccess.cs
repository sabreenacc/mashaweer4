/************************************************************************/
/*  Class name      : DBAccess                                          */
/*  Created         : 5/April/2011                                      */
/*  Author          : Karim Abd El-AAl                                  */
/*  Functionallty   : Handle Database Oberations Dynamically            */
/************************************************************************/
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Linq;
using System.Linq;
using System.Linq.Dynamic;

namespace DBAccess
{
    public static class DBAccess
    {
        public static List<T> Search<T>(this DataContext pDALDataContext, System.Linq.Expressions.Expression<Func<T, bool>> pWhereCondition) where T : class
        {
            return pDALDataContext.GetTable<T>().Where(pWhereCondition).AsParallel().ToList();
        }
        public static List<T> GetAll<T>(this DataContext pDALDataContext) where T : class
        {
            return pDALDataContext.GetTable<T>().AsParallel().ToList();
        }
        public static T Single<T>(this DataContext pDALDataContext, object pPrimaryKey) where T : class, System.ComponentModel.INotifyPropertyChanged
        {
            return pDALDataContext.GetTable<T>().Where(DynamicQueryable.GetPrimaryKey<T>().Name + ".Equals(@0)", pPrimaryKey).FirstOrDefault();
        }
        public static bool Delete<T>(this DataContext pDALDataContext, object pPrimaryKey) where T : class, System.ComponentModel.INotifyPropertyChanged
        {
            try
            {
                var tTable = pDALDataContext.GetTable<T>();
                var tDelObj = tTable.Where(DynamicQueryable.GetPrimaryKey<T>().Name + ".Equals(@0)", pPrimaryKey).FirstOrDefault();
                tTable.DeleteOnSubmit(tDelObj);
                pDALDataContext.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Delete<T>(this T pDeletedObject, DataContext pDALDataContext) where T : class, System.ComponentModel.INotifyPropertyChanged
        {
            try
            {
                var tTable = pDALDataContext.GetTable<T>();
                var tDelObj = tTable.Where(x => x == pDeletedObject).FirstOrDefault();
                tTable.DeleteOnSubmit(tDelObj);
                pDALDataContext.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static object Insert<T>(this DataContext pDALDataContext, T pInsertedObject) where T : class, System.ComponentModel.INotifyPropertyChanged
        {
            try
            {
                pDALDataContext.GetTable<T>().InsertOnSubmit(pInsertedObject);
                pDALDataContext.SubmitChanges();
                return DynamicQueryable.GetPrimaryKey<T>().GetValue(pInsertedObject, null);
            }
            catch
            {
                return null;
            }
        }
        public static object Insert<T>(this T pInsertedObject, DataContext pDALDataContext) where T : class, System.ComponentModel.INotifyPropertyChanged
        {
            try
            {
                pDALDataContext.GetTable<T>().InsertOnSubmit(pInsertedObject);
                pDALDataContext.SubmitChanges();
                return DynamicQueryable.GetPrimaryKey<T>().GetValue(pInsertedObject, null);
            }
            catch
            {
                return null;
            }
        }
        public static bool Update<T>(this DataContext pDALDataContext, T pUpdatedObject) where T : class, System.ComponentModel.INotifyPropertyChanged
        {
            try
            {
                var tTable = pDALDataContext.GetTable<T>();
                var propPrimaryKey = DynamicQueryable.GetPrimaryKey<T>();
                var tUpdatedObj = tTable.Where(propPrimaryKey.Name + ".Equals(@0)", propPrimaryKey.GetValue(pUpdatedObject, null)).FirstOrDefault();
                tTable.Attach(pUpdatedObject, tUpdatedObj);
                pDALDataContext.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Update<T>(this T pUpdatedObject, DataContext pDALDataContext) where T : class, System.ComponentModel.INotifyPropertyChanged
        {
            try
            {
                var tTable = pDALDataContext.GetTable<T>();
                var propPrimaryKey = DynamicQueryable.GetPrimaryKey<T>();
                var tUpdatedObj = tTable.Where(propPrimaryKey.Name + ".Equals(@0)", propPrimaryKey.GetValue(pUpdatedObject, null)).FirstOrDefault();

                PropertyDescriptorCollection originalProps = TypeDescriptor.GetProperties(pUpdatedObject);
                // set the new object to match the passed in object
                foreach (PropertyDescriptor currentProp in originalProps)
                {
                    if (currentProp.Attributes[typeof( System.Data.Linq.Mapping.ColumnAttribute)] != null)
                    {
                        object val = currentProp.GetValue(pUpdatedObject);
                        currentProp.SetValue(tUpdatedObj, val);
                    }
                }
                pDALDataContext.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
