package vn.edu.hcmuaf.fit.model;

import java.sql.Timestamp;
import java.text.Normalizer;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

public class Utils {

    public static String formatCurrency(double price) {
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        String formattedPrice = numberFormat.format(price);
        formattedPrice = formattedPrice.replaceAll("[đ₫,]", "");
        return formattedPrice.trim();
    }

    public static String convertDateFormat(Timestamp inputDate) {
        // Kiểm tra inputDate có null không
        if (inputDate == null) {
            return null;
        }

        // Tạo đối tượng SimpleDateFormat để định dạng ngày tháng
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

        // Sử dụng Timestamp để lấy Date
        Date date = new Date(inputDate.getTime());

        // Định dạng Date và trả về kết quả dưới dạng chuỗi
        return outputFormat.format(date);
    }

    public static int convertToInt(String price) {
        String cleaner = price.replace(".", "").trim();
        return Integer.parseInt(cleaner);
    }

    public static String formatTimestamp(Timestamp timestamp) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(new Date(timestamp.getTime()));
    }

    public static String formatTimestampWithoutTime(Timestamp timestamp) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(new Date(timestamp.getTime()));
    }

    public static String dateFormat(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }

    public static String dateFormatNoTime(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

    public static String generateSlug(String input) {
        String convertedString =
                Normalizer
                        .normalize(input, Normalizer.Form.NFD)
                        .replaceAll("[^\\p{ASCII}]", "").replaceAll(" ", "-");
        return convertedString;
    }

    public static String revertDate(String date){
        String day = date.substring(0,date.indexOf("-"));
        String month = date.substring(date.indexOf("-")+1,date.lastIndexOf("-"));
        String year = date.substring(date.lastIndexOf("-")+1,date.length());
        return year+"-"+month+"-"+day;
    }

    public static boolean isStrongPassword(String password) {
        try {
            // Độ dài ít nhất 8 ký tự, chứa số, chữ hoa, chữ thường và ký tự đặc biệt
            String strongPasswordPattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]).{8,}$";
            return password.matches(strongPasswordPattern);
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isValidEmail(String email) {
        try {
            String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$";
            return email.matches(emailRegex);
        } catch (Exception e) {
            return false;
        }
    }

    public static String generateRandomPassword() {
        String upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        String specialCharacters = "!@#$%^&*()_+-=[]{};':\"\\|,.<>/?";
        String combinedChars = upperCaseLetters + lowerCaseLetters + numbers + specialCharacters;

        Random random = new Random();
        StringBuilder password = new StringBuilder();

        password.append(upperCaseLetters.charAt(random.nextInt(upperCaseLetters.length())));
        password.append(lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length())));
        password.append(numbers.charAt(random.nextInt(numbers.length())));
        password.append(specialCharacters.charAt(random.nextInt(specialCharacters.length())));

        while (password.length() < 12) {
            password.append(combinedChars.charAt(random.nextInt(combinedChars.length())));
        }
        char[] pwdArray = password.toString().toCharArray();
        for (int i = pwdArray.length - 1; i > 0; i--) {
            int j = random.nextInt(i + 1);
            char temp = pwdArray[i];
            pwdArray[i] = pwdArray[j];
            pwdArray[j] = temp;
        }
        return new String(pwdArray);
    }
}