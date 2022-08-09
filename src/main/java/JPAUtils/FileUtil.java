

package JPAUtils;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class FileUtil {

    public static File saveFileUpload(String nameFolder, Part part) {
        File folderUpload = new File(nameFolder);
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        File file = new File(folderUpload, part.getSubmittedFileName());
        System.out.println(file.getAbsolutePath());
        try {
            part.write(file.getAbsolutePath());
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        return file;
    }
}