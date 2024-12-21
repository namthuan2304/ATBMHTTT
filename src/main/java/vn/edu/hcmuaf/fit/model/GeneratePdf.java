package vn.edu.hcmuaf.fit.model;

import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.color.DeviceRgb;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.border.DashedBorder;
import com.itextpdf.layout.border.SolidBorder;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.VerticalAlignment;
import vn.edu.hcmuaf.fit.service.impl.DeliveryService;
import vn.edu.hcmuaf.fit.service.impl.OrderService;
import vn.edu.hcmuaf.fit.service.impl.OrderStatusService;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class GeneratePdf {
    public static final String fontPath = "src/main/resources/fonts/";
    public static final String vuArialFont = "vuArial.ttf";
    public static final String vuArialBoldFont = "vuArialBold.ttf";
    public static final String vuArialBoldItalicFont = "vuArialBoldItalic.ttf";
    public static final String vuArialItalicFont = "vuArialItalic.ttf";

    public static void generateInvoice(Order order, List<OrderItem> item, String ip, String addressLink, OutputStream outputStream) throws IOException {

        PdfWriter writer = new PdfWriter(outputStream);
        PdfDocument pdfDocument = new PdfDocument(writer);
        pdfDocument.setDefaultPageSize(PageSize.A4);
        Document document = new Document(pdfDocument);

        PdfFont vuArial = PdfFontFactory.createFont(fontPath + vuArialFont, PdfEncodings.IDENTITY_H, true);
        PdfFont vuArialBold = PdfFontFactory.createFont(fontPath + vuArialBoldFont, PdfEncodings.IDENTITY_H, true);
        PdfFont vuArialBoldItalic = PdfFontFactory.createFont(fontPath + vuArialBoldItalicFont, PdfEncodings.IDENTITY_H, true);
        PdfFont vuArialItalic = PdfFontFactory.createFont(fontPath + vuArialItalicFont, PdfEncodings.IDENTITY_H, true);

        DeliveryAddress address = DeliveryService.getInstance().loadAddressByOrder(order);
        OrderStatus status = OrderStatusService.getInstance().getStatusById(order.getStatus());

        float threecol = 190f;
        float twocols = 285f;
        float twocols80 = twocols + 80f;
        float[] twocolumnWidth = {twocols80, twocols};
        float threeColumnWidth[] = {threecol, threecol, threecol};
        float fullwidth[] = {threecol*3};
        Paragraph onesp = new Paragraph("\n");

        // Tao phan hoa don va thong tin hoa don
        Table table = new Table(twocolumnWidth);
        table.setBackgroundColor(new DeviceRgb(63, 169, 219)).setFontColor(Color.WHITE);
        table.addCell(new Cell().add("HOÁ ĐƠN").setFontSize(30f).setBorder(Border.NO_BORDER).setVerticalAlignment(VerticalAlignment.MIDDLE)
                .setFont(vuArialBold).setTextAlignment(TextAlignment.CENTER).setMarginBottom(30f).setMarginTop(30f));

        Table nestedTable = new Table(new float[]{twocols * 0.4f, twocols * 0.6f});
        nestedTable.setMarginBottom(30f).setMarginTop(30f).setVerticalAlignment(VerticalAlignment.MIDDLE);
        nestedTable.addCell(new Cell().add("Số hoá đơn:").setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT)
                .setVerticalAlignment(VerticalAlignment.MIDDLE).setFont(vuArialBold));
        nestedTable.addCell(new Cell().add(order.getId()+ "").setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT)
                .setVerticalAlignment(VerticalAlignment.MIDDLE).setFont(vuArialItalic));
        nestedTable.addCell(new Cell().add("Thời gian tạo:").setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT)
                .setVerticalAlignment(VerticalAlignment.MIDDLE).setFont(vuArialBold));
        nestedTable.addCell(new Cell().add(Utils.convertDateFormat(order.getDateCreated())).setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT)
                .setVerticalAlignment(VerticalAlignment.MIDDLE).setFont(vuArialItalic));

        table.addCell(new Cell().add(nestedTable).setBorder(Border.NO_BORDER));
        document.add(table);
        document.add(onesp);

        Border gb = new SolidBorder(new DeviceRgb(63, 169, 219), 2f);
        Table divider = new Table(fullwidth);
        divider.setBorder(gb);

        Table twoColTable = new Table(twocolumnWidth);
        twoColTable.addCell(getBillingAndShippingCell("Thông tin người bán:").setFont(vuArialBold));
        twoColTable.addCell(getBillingAndShippingCell("Thông tin người mua:").setFont(vuArialBold));
        document.add(twoColTable.setMarginBottom(12f));

        Table twocolTable2 = new Table(twocolumnWidth);
        twocolTable2.addCell(getCell10Left("Tên người bán:", vuArialItalic));
        twocolTable2.addCell(getCell10Left("Tên người mua:", vuArialItalic));
        twocolTable2.addCell(getCell10Left("Công ty thuốc thú y The Pet", vuArial));
        twocolTable2.addCell(getCell10Left(address.getFullName(), vuArial));
        document.add(twocolTable2);

        Table twocolTable3 = new Table(twocolumnWidth);
        twocolTable3.addCell(getCell10Left("Số hotline:", vuArialItalic));
        twocolTable3.addCell(getCell10Left("Số điện thoại:", vuArialItalic));
        twocolTable3.addCell(getCell10Left("1900 9054", vuArial));
        twocolTable3.addCell(getCell10Left( address.getPhone(), vuArial));
        document.add(twocolTable3);

        Table twocolTable4 = new Table(twocolumnWidth);
        twocolTable4.addCell(getCell10Left("Địa chỉ:", vuArialItalic));
        twocolTable4.addCell(getCell10Left("Địa chỉ:", vuArialItalic));
        twocolTable4.addCell(getCell10Left("Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh.", vuArial));
        twocolTable4.addCell(getCell10Left(address.getDetailAddress() + ", " + address.getWard() + ", " + address.getDistrict() + ", " + address.getProvince(), vuArial));
        document.add(twocolTable4);

        Table twocolTable5 = new Table(twocolumnWidth);
        twocolTable5.addCell(getCell10Left("Email:", vuArialItalic));
        twocolTable5.addCell(getCell10Left("Email", vuArialItalic));
        twocolTable5.addCell(getCell10Left("doanwebnhom30@gmail.com", vuArial));
//        twocolTable5.addCell(getCell10Left(address., vuArial));
        document.add(twocolTable5);

        float oneColumnwidth[] = {twocols + 150f};
        Table oneColTable1 = new Table(oneColumnwidth);
        oneColTable1.addCell(getCell10Left("Email:", vuArialItalic));
        oneColTable1.addCell(getCell10Left("doanwebnhom30@gmail.com", vuArial));
        document.add(oneColTable1.setMarginBottom(10f));

        Table tableDivider2 = new Table(fullwidth);
        Border dgb = new DashedBorder(Color.GRAY, 0.5f);
        document.add(tableDivider2.setBorder(dgb));
        Paragraph productPara = new Paragraph("Products");
        document.add(productPara.setFont(vuArial));

        Table threeColTable1 = new Table(threeColumnWidth);
        threeColTable1.setBackgroundColor(Color.GRAY, 0.7f);

        threeColTable1.addCell(new Cell().add("Description").setFont(vuArial).setFontColor(Color.WHITE).setBorder(Border.NO_BORDER));
        threeColTable1.addCell(new Cell().add("Quantity").setFont(vuArial).setFontColor(Color.WHITE).setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
        threeColTable1.addCell(new Cell().add("Price").setFont(vuArial).setFontColor(Color.WHITE).setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER).setMarginRight(15f));
        document.add(threeColTable1);
        Table threeColTable2 = new Table(threeColumnWidth);
        float totalSum = 0f;
        Integer sum = OrderService.getInstance().getOrderPriceHasVoucher(order);
        if (sum == null) sum = OrderService.getInstance().getOrderPriceNotVoucher(order);

        for (OrderItem oi : item) {
            float total = oi.getQuantity()*oi.getOrderPrice();
            totalSum += total;
            Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(oi.getProduct(), ip, addressLink);
            for (Product p : products.keySet()) {
                threeColTable2.addCell(new Cell().add(p.getProductName()).setBorder(Border.NO_BORDER).setMarginLeft(10f));
            }
            threeColTable2.addCell(new Cell().add(String.valueOf(oi.getQuantity())).setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
            threeColTable2.addCell(new Cell().add(String.valueOf(total) + " VND").setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER).setMarginRight(15f));
        }
        document.add(threeColTable2.setMarginBottom(20f));
        float onetwo[] = {threecol+125f, threecol*2};
        Table threeColTable4 = new Table(onetwo);
        threeColTable4.addCell(new Cell().add("").setBorder(Border.NO_BORDER));
        threeColTable4.addCell(new Cell().add(tableDivider2).setBorder(Border.NO_BORDER));
        document.add(threeColTable4);

        Table threeColTable3 = new Table(threeColumnWidth);
        threeColTable3.addCell(new Cell().add("").setBorder(Border.NO_BORDER)).setMarginLeft(10f);
        threeColTable3.addCell(new Cell().add("Total").setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
        threeColTable3.addCell(new Cell().add(String.valueOf(totalSum) + " VND").setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER).setMarginRight(15f));

        Table threeColTable5 = new Table(threeColumnWidth);
        threeColTable5.addCell(new Cell().add("").setBorder(Border.NO_BORDER)).setMarginLeft(10f);
        threeColTable5.addCell(new Cell().add("Discount").setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
        threeColTable5.addCell(new Cell().add(String.valueOf(totalSum - sum) + " VND").setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER).setMarginRight(15f));

        Table threeColTable6 = new Table(threeColumnWidth);
        threeColTable6.addCell(new Cell().add("").setBorder(Border.NO_BORDER)).setMarginLeft(10f);
        threeColTable6.addCell(new Cell().add("Shipping").setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
        threeColTable6.addCell(new Cell().add(String.valueOf(20000.0f) + " VND").setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER).setMarginRight(15f));

        Table threeColTable7 = new Table(threeColumnWidth);
        threeColTable7.addCell(new Cell().add("").setBorder(Border.NO_BORDER)).setMarginLeft(10f);
        threeColTable7.addCell(new Cell().add("Remain").setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
        threeColTable7.addCell(new Cell().add(String.valueOf(sum + 20000.0f) + " VND").setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER).setMarginRight(15f));

        document.add(threeColTable3);
        document.add(threeColTable5);
        document.add(threeColTable6);
        document.add(threeColTable7);
        document.add(tableDivider2);
        document.add(new Paragraph("\n"));
        document.add(divider.setBorder(new SolidBorder(Color.GRAY, 1)).setMarginBottom(15f));

        Table tb = new Table(fullwidth);
        tb.addCell(new Cell().add("TERMS AND CONDITIONS\n").setFont(vuArial).setBorder(Border.NO_BORDER));
        List<String> TncList = new ArrayList<>();
        TncList.add("1. This Agreement shall be governed by and construed in accordance with the laws of the Republic of Vietnam, without regard to its conflict of laws provisions.");
        TncList.add("2. The parties hereto agree that this Agreement shall be binding upon and inure to the benefit of the parties and their respective successors, assigns, and permitted assigns.");

        for (String tnc: TncList) {
            tb.addCell(new Cell().add(tnc).setBorder(Border.NO_BORDER));
        }
        document.add(tb);
        document.close();
    }

    static Cell getHeaderTextCell(String textValue) {
        return new Cell().add(textValue).setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.RIGHT);
    }

    static Cell getHeaderTextCellValue(String textValue) {
        return new Cell().add(textValue).setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT);
    }

    static Cell getBillingAndShippingCell(String textValue) {
        return new Cell().add(textValue).setFontSize(12f).setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT);
    }

    static  Cell getCell10Left(String textValue, PdfFont font) {
        Cell cell = new Cell().add(textValue).setFontSize(10f).setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT).setFont(font);
        return cell;
    }


    public static void main(String[] args) throws IOException {
        String path = "D:\\Font.pdf";
        PdfWriter writer = new PdfWriter(path);
        PdfDocument pdfDocument = new PdfDocument(writer);
        pdfDocument.setDefaultPageSize(PageSize.A4);
        Document document = new Document(pdfDocument);

        PdfFont vuArial = PdfFontFactory.createFont(fontPath + vuArialFont, PdfEncodings.IDENTITY_H, true);
        PdfFont vuArialBold = PdfFontFactory.createFont(fontPath + vuArialBoldFont, PdfEncodings.IDENTITY_H, true);
        PdfFont vuArialBoldItalic = PdfFontFactory.createFont(fontPath + vuArialBoldItalicFont, PdfEncodings.IDENTITY_H, true);
        PdfFont vuArialItalic = PdfFontFactory.createFont(fontPath + vuArialItalicFont, PdfEncodings.IDENTITY_H, true);

        float threecol = 190f;
        float twocols = 285f;
        float twocols80 = twocols + 80f;
        float[] twocolumnWidth = {twocols80, twocols};
        float threeColumnWidth[] = {threecol, threecol, threecol};
        float fullwidth[] = {threecol*3};

        Table table = new Table(twocolumnWidth);
        table.setBackgroundColor(new DeviceRgb(173, 255, 47)).setFontColor(Color.WHITE);
        table.addCell(new Cell().add("HOÁ ĐƠN").setFontSize(30f).setBorder(Border.NO_BORDER).setVerticalAlignment(VerticalAlignment.MIDDLE)
                .setFont(vuArialBold).setTextAlignment(TextAlignment.CENTER).setMarginBottom(30f).setMarginTop(30f));

        Table nestedTable = new Table(new float[]{twocols * 0.4f, twocols * 0.6f});
        nestedTable.setMarginBottom(30f).setMarginTop(30f).setVerticalAlignment(VerticalAlignment.MIDDLE);
        nestedTable.addCell(new Cell().add("Số hoá đơn:").setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT)
                                                            .setVerticalAlignment(VerticalAlignment.MIDDLE).setFont(vuArialBold));
        nestedTable.addCell(new Cell().add("98").setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT)
                                                            .setVerticalAlignment(VerticalAlignment.MIDDLE).setFont(vuArialItalic));
        nestedTable.addCell(new Cell().add("Thời gian tạo:").setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT)
                                                            .setVerticalAlignment(VerticalAlignment.MIDDLE).setFont(vuArialBold));
        nestedTable.addCell(new Cell().add("15-12-2024 02:18:39").setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT)
                                                            .setVerticalAlignment(VerticalAlignment.MIDDLE).setFont(vuArialItalic));

        table.addCell(new Cell().add(nestedTable).setBorder(Border.NO_BORDER));
        document.add(table);
        document.close();
        System.out.println("PDF Created");
    }
}