// +build kubeall kubernetes

// NOTE: we have build tags to differentiate kubernetes tests from non-kubernetes tests. This is done because minikube
// is heavy and can interfere with docker related tests in terratest. Specifically, many of the tests start to fail with
// `connection refused` errors from `minikube`. To avoid overloading the system, we run the kubernetes tests and helm
// tests separately from the others. This may not be necessary if you have a sufficiently powerful machine.  We
// recommend at least 4 cores and 16GB of RAM if you want to run all the tests together.

package k8s

import (
	"strings"
	"testing"

	"github.com/stretchr/testify/require"
	corev1 "k8s.io/api/core/v1"

	"github.com/gruntwork-io/terratest/modules/random"
)

func TestNamespaces(t *testing.T) {
	t.Parallel()

	uniqueId := random.UniqueId()
	namespaceName := strings.ToLower(uniqueId)
	options := NewKubectlOptions("", "")
	CreateNamespace(t, options, namespaceName)
	defer func() {
		DeleteNamespace(t, options, namespaceName)
		namespace := GetNamespace(t, options, namespaceName)
		require.Equal(t, namespace.Status.Phase, corev1.NamespaceTerminating)
	}()

	namespace := GetNamespace(t, options, namespaceName)
	require.Equal(t, namespace.Name, namespaceName)
}
