namespace eShop.Web.CustomerPortal.Models
{
    public class Monitor
    {
        public string Name { get; set; }
        public double Price { get; set; }
        public double ScreenSize { get; set; }
        public string Resolution { get; set; }
        public int RefreshRate { get; set; }
        public double ResponseTime { get; set; }
        public string PanelType { get; set; }
        public string AspectRatio { get; set; }
    }
}