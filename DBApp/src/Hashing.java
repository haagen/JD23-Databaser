import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class Hashing {

    private static final int SALT_LENGTH = 16;

    public static String Encrypt(String password) {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[SALT_LENGTH];
        random.nextBytes(salt);

        try {
            // Skapa en instans av SHA-256 hash-funktionen
            MessageDigest digest = MessageDigest.getInstance("SHA-256");

            // Lägg till vårt salt
            digest.update(salt);

            // Beräkna hash för password
            byte[] hashedPassword = digest.digest(password.getBytes());
            return byteArrayToHexString(hashedPassword) + byteArrayToHexString(salt);
        } catch (NoSuchAlgorithmException ex) {
            return null;
        }
    }

    public static boolean Verify(String password, String hashedPassword) {
        String passwordHash = hashedPassword.substring(0, 64);
        String saltHex = hashedPassword.substring(64);
        byte[] salt = hexStringToByteArray(saltHex);

        try {
            // Skapa en instans av SHA-256 hash-funktionen
            MessageDigest digest = MessageDigest.getInstance("SHA-256");

            // Lägg till vårt salt
            digest.update(salt);

            // Beräkna hash för password
            byte[] hashedInputPassword = digest.digest(password.getBytes());
            String hashedInputPasswordHex = byteArrayToHexString(hashedInputPassword);
            return passwordHash.equals(hashedInputPasswordHex);
        } catch (NoSuchAlgorithmException ex) {
            return false;
        }
    }

    // binär byte-array -> Sträng med hexadecimala tal
    private static String byteArrayToHexString(byte[] array) {
        StringBuilder sb = new StringBuilder();
        for(byte b : array) {
           sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    // Hexadecimal sträng -> binär byte array
    private static byte[] hexStringToByteArray(String s) {
        int len = s.length();
        byte[] data = new byte[ len / 2 ];
        for(int i=0; i < len; i += 2) {
            data[i/2] = (byte) ((Character.digit(s.charAt(i), 16) << 4) + Character.digit(s.charAt(i+1), 16));
        }
        return data;
    }

}
