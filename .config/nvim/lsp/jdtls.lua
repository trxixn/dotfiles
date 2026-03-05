-- Configuration for the Java Development Tools Language Server (JDTLS)

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

-- 1. Customize these paths for your system (These look correct based on your setup)
local JAVA_HOME = '/Users/traiansfarghiu/.sdkman/candidates/java/current'
local JDTLS_PATH = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local JDTLS_WORKSPACE = vim.fn.stdpath('data') .. '/jdtls-workspace/' .. project_name

-- 2. Define the launcher JAR path (Crucial for launching the server)
-- NOTE: The version part (1.7.0.v20250519-0528) MUST match the file on your disk.
local LAUNCHER_JAR = JDTLS_PATH .. '/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar'

if not vim.fn.filereadable(LAUNCHER_JAR) then
    vim.notify("JDTLS Launcher JAR not found. Please check JDTLS_PATH and LAUNCHER_JAR name.", vim.log.levels.ERROR)
    return {} -- Stop configuration if the launcher file is missing
end

return {
    -- The command array passed to vim.lsp.start_client()
    cmd = {
        JAVA_HOME .. '/bin/java', -- 1. The Java executable
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1G', -- Allocate 1GB of memory to the server
        
        -- Essential JVM arguments for module resolution
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        
        '-jar', LAUNCHER_JAR, -- 2. The JDTLS launcher JAR
        
        -- 🚨 Corrected to 'config_mac' for macOS
        '-configuration', JDTLS_PATH .. '/config_mac', 
        
        '-data', JDTLS_WORKSPACE, -- 3. Project workspace cache
        
        -- Additional essential arguments for stability and encoding
        '-Dclient.name=nvim', 
        '-Dfile.encoding=UTF-8',
    },

    -- Filetypes that trigger the JDTLS server
    filetypes = { 'java', 'gradle', 'groovy', 'kotlin' },

    -- Root markers JDTLS looks for to define the project directory.
    root_markers = { 'build.gradle', 'pom.xml', '.git', 'mvnw', 'gradlew' },

    -- Common settings for JDTLS
    settings = {
        java = {
            project = {
                sourcePaths = {"src"}
            },
            contentProvider = { preferred = 'jdtls' },
            signatureHelp = { enabled = true },
            completion = { 
                favoriteStaticMembers = { 
                    'org.hamcrest.MatcherAssert.assertThat', 
                    'org.hamcrest.Matchers.*', 
                    'org.hamcrest.core.StringContains.containsString' 
                }, 
            },
        },
    },

    -- Note: on_attach function is assumed to be handled by your global LspAttach Autocommand.
}
