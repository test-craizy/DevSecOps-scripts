# Set the absolute path to the folder
if [ -n "${{ inputs.componente.folder }}" ]; then
    echo "absolutePathFolder=${{ github.workspace }}/${{ inputs.componente.folder }}" >> $GITHUB_ENV
    echo "absolutePathPom=${{ github.workspace }}/${{ inputs.componente.folder }}/pom.xml" >> $GITHUB_ENV
else
    echo "absolutePathFolder=${{ github.workspace }}" >> $GITHUB_ENV
    echo "absolutePathPom=${{ github.workspace }}/pom.xml" >> $GITHUB_ENV
fi

# Set Maven options
echo "mavenOptions=-Xmx3072m" >> $GITHUB_ENV

# Set JDK architecture option
echo "jdkArchitectureOption=x64" >> $GITHUB_ENV

# Set whether to publish JUnit results
echo "publishJUnitResults=true" >> $GITHUB_ENV

# Set the script path
echo "scriptPath=devops-scripts/azure-devops/templates/scripts" >> $GITHUB_ENV

# Set the AKS script path
echo "AKS_SCRIPT_PATH=devops-scripts/azure-devops/templates/aks/private/scripts" >> $GITHUB_ENV

# Set the certificadoHV variable
if [ -n "${{ inputs.componente.certificadoHV }}" ]; then
    echo "certificadoHV=${{ inputs.componente.certificadoHV }}" >> $GITHUB_ENV  
else
    echo "certificadoHV=false" >> $GITHUB_ENV
fi

# Set the certificadoAG variable
if [ -n "${{ inputs.componente.certificadoAG }}" ]; then
    echo "certificadoAG=${{ inputs.componente.certificadoAG }}" >> $GITHUB_ENV
else
    echo "certificadoAG=false" >> $GITHUB_ENV
fi

# Set the certificadoCA variable
if [ -n "${{ inputs.componente.certificadoCA }}" ]; then
    echo "certificadoCA=${{ inputs.componente.certificadoCA }}" >> $GITHUB_ENV
else
    echo "certificadoCA=false" >> $GITHUB_ENV
fi

# Set the manifests folder name
echo "manifestsFolderName=manifests" >> $GITHUB_ENV