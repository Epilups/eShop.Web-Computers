﻿using eShop.CoreBusiness.Models;
using eShop.UseCases.PluginInterfaces.DataStore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace eShop.DataStore.SQL.Dapper
{
    public class OrderRepository : IOrderRepository
    {
        private readonly IDataAccess dataAccess;

        public OrderRepository(IDataAccess dataAccess)
        {
            this.dataAccess = dataAccess;
        }

        public int CreateOrder(Order order)
        {
            // create order
            var sql = 
                @"INSERT INTO [eShop2].[dbo].[Order]
                       ([DatePlaced]
                       ,[DateProcessing]
                       ,[DateProcessed]
                       ,[CustomerName]
                       ,[CustomerAddress]
                       ,[CustomerCity]
                       ,[CustomerStateProvince]
                       ,[CustomerCountry]
                       ,[AdminUser]
                       ,[UniqueId])
                 OUTPUT INSERTED.OrderId
                 VALUES
                       (@DatePlaced
                        ,@DateProcessing
                        ,@DateProcessed
                        ,@CustomerName
                        ,@CustomerAddress
                        ,@CustomerCity
                        ,@CustomerStateProvince
                        ,@CustomerCountry
                        ,@AdminUser
                        ,@UniqueId)";

            var orderId = dataAccess.QuerySingle<int, Order>(sql, order);

            sql = @"INSERT INTO [eShop2].[dbo].[OrderLineItem]
                           ([ProductId]
                           ,[OrderId]
                           ,[Quantity]
                           ,[Price])
                     VALUES
                           (@ProductId
                           ,@OrderId
                           ,@Quantity
                           ,@Price)";
            
            // create line items
            order.LineItems.ForEach(x => x.OrderId = orderId);
            dataAccess.ExecuteCommand(sql, order.LineItems);

            return orderId;

        }

        public IEnumerable<OrderLineItem> GetLineItemsByOrderId(int orderId)
        {
            var sql = "SELECT * FROM [eShop2].[dbo].OrderLineItem WHERE OrderId = @OrderId";
            var lineItems = dataAccess.Query<OrderLineItem, dynamic>(sql, new { OrderId = orderId });

            sql = "SELECT * FROM [eShop2].[dbo].Product WHERE ProductId = @ProductId";
            lineItems.ForEach(x => x.Product = dataAccess.QuerySingle<Product, dynamic>(sql, new { ProductId = x.ProductId }));

            return lineItems;
        }

        public Order GetOrder(int id)
        {
            var sql = "SELECT * FROM [eShop2].[dbo].[ORDER] WHERE OrderId = @OrderId";
            var order = dataAccess.QuerySingle<Order, dynamic>(sql, new { OrderId = id });
            order.LineItems = GetLineItemsByOrderId(order.OrderId.Value).ToList();

            return order;
        }

        public Order GetOrderByUniqueId(string uniqueId)
        {
            var sql = "SELECT * FROM [eShop2].[dbo].[ORDER] WHERE UniqueId = @UniqueId";
            var order = dataAccess.QuerySingle<Order, dynamic>(sql, new { UniqueId = uniqueId });
            order.LineItems = GetLineItemsByOrderId(order.OrderId.Value).ToList();

            return order;
        }

        public IEnumerable<Order> GetOrders()
        {
            return dataAccess.Query<Order, dynamic>("SELECT * FROM [eShop2].[dbo].[ORDER]", new { });
        }

        public IEnumerable<Order> GetOutstandingOrders()
        {
            var sql = "SELECT * FROM [eShop2].[dbo].[ORDER] WHERE DateProcessed is null";
            return dataAccess.Query<Order, dynamic>(sql, new { });
        }

        public IEnumerable<Order> GetProcessedOrders()
        {
            var sql = "SELECT * FROM [eShop2].[dbo].[ORDER] WHERE DateProcessed is not null";
            return dataAccess.Query<Order, dynamic>(sql, new { });
        }

        public void UpdateOrder(Order order)
        {
            // update order
            var sql = @"UPDATE [eShop2].[dbo].[Order]
                          SET [DatePlaced] = @DatePlaced
                          ,[DateProcessing] = @DateProcessing
                          ,[DateProcessed] = @DateProcessed
                          ,[CustomerName] = @CustomerName
                          ,[CustomerAddress] = @CustomerAddress
                          ,[CustomerCity] = @CustomerCity
                          ,[CustomerStateProvince] = @CustomerStateProvince
                          ,[CustomerCountry] = @CustomerCountry
                          ,[AdminUser] = @AdminUser
                          ,[UniqueId] = @UniqueId
                      WHERE OrderId = @OrderId";

            dataAccess.ExecuteCommand(sql, order);

            // update line items
            sql = @"UPDATE [eShop2].[dbo].[OrderLineItem]
                       SET [ProductId] = @ProductId
                          ,[OrderId] = @OrderId
                          ,[Quantity] = @Quantity
                          ,[Price] = @Price
                     WHERE LineItemId = @LineItemId";

            dataAccess.ExecuteCommand(sql, order.LineItems);
        }
    }
}
