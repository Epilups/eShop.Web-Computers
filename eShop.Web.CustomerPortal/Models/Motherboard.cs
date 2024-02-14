namespace eShop.Web.CustomerPortal.Models
{
    public class Motherboard
    {
        public string Name { get; set; }
        public double Price { get; set; }
        public string Socket { get; set; }
        public string FormFactor { get; set; }
        public int MaxMemory { get; set; }
        public int MemorySlotsCount { get; set; }
        public string Color { get; set; }
    }
}